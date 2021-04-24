When(/^Отправил POST запрос на URL `(.*)` c параметрами:$/) do |url, table|
  headers_hash = { 'Content-Type' => 'application/json', :Accept => 'application/json' }
  parameters = table.rows.flatten
  payload_hash = {
    "id": "#{parameters[1]}".to_i,
    "category": {
      "id": "#{parameters[3]}".to_i,
      "name": "#{parameters[5]}"
    },
    "name": "#{parameters[7]}",
    "photoUrls": [
      "#{parameters[9]}"
    ],
    "tags": [
      {
        "id": "#{parameters[11]}".to_i,
        "name": "#{parameters[13]}"
      }
    ],
    "status": "#{parameters[15]}"
  }
  payload_hash = payload_hash.to_json
  log_request(url, payload_hash, headers_hash)
  @response = send_post(url, payload_hash, headers_hash)
  log_response(@response)
end

When(/^Отправил DELETE запрос на URL `(.*)` c path параметром `(.*)`$/) do |url, parameter|
  headers_hash = { Accept: 'application/json' }
  url = url.concat('/' + parameter)
  p url
  log_request(url, headers_hash)
  @response = send_delete(url, headers_hash)
  log_response(@response)
end

When(/^Делаю GET запрос на URL `(.*)` c query параметрами:$/) do |url, table|
  headers_hash = { Accept: 'application/json' }
  url.concat('?')
  table.hashes.each do |param|
    if url.end_with?('?')
      url.concat(param[:key], '=', param[:value])
    else
      url.concat('&', param[:key], '=', param[:value])
    end
  end
  @response = send_get url, headers_hash
end

Then(/^Убедился, что код REST ответа = `(.*)`$/) do |expected_code|
  expect(@response.code).to eq(expected_code.to_i)
end

Then(/^Распарсил JSON ответ$/) do
  @response = JSON.parse @response
end

Then(/^Вывод JSON ответа$/) do
  pp @response
end