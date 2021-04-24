When(/^Отправил POST запрос для создания животного на URL `(.*)` c параметрами:$/) do |url, table|
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
  @response = send_post(url, payload_hash, headers_hash)
end

When(/^Отправил PUT запрос на URL `(.*)` и параметрами:$/) do |url, table|
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
  @response = send_put(url, payload_hash, headers_hash)
end

When(/^Отправил DELETE запрос на URL `(.*)` c path параметром `(.*)`$/) do |url, parameter|
  headers_hash = { Accept: 'application/json' }
  url = url.concat('/' + parameter)
  @response = send_delete(url, headers_hash)
end

When(/^Отправил GET запрос на URL `(.*)` c query параметрами:$/) do |url, table|
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

When(/^Создал животное$/) do
  steps %{* Отправил POST запрос для создания животного на URL `https://petstore.swagger.io/v2/pet` c параметрами:
            | key           | value    |
            | id            |          |
            | category id   |          |
            | category name |          |
            | name          | ipr name |
            | photoUrls     | ipr url  |
            | tags id       |          |
            | tags name     |          |
            | status        |          |}
end

Then(/^Удалил животное по сохраненному id$/) do
  step "Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/pet` c path параметром `#{@saved_pet_id}`"
end

Then(/^Убедился, что код REST ответа = `(.*)`$/) do |expected_code|
  expect(@response.code).to eq(expected_code.to_i)
end

Then(/^Распарсил JSON ответ$/) do
  @response = JSON.parse @response
end

Then(/^Запомнил id созданного или измененного животного$/) do
  @saved_pet_id = @response["id"].to_i
end

Then(/^Вывод JSON ответа$/) do
  pp @response.to_s
end