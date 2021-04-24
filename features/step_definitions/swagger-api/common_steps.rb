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
  @request_hash = payload_hash
  payload_hash = payload_hash.to_json
  log_request(url, payload_hash, headers_hash)
  @response = send_post(url, payload_hash, headers_hash)
  log_response(@response)
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