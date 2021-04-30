When(/^Отправил PUT запрос на URL `(.*)` c сохраненным id и параметрами:$/) do |url, table|
  headers_hash = { 'Content-Type' => 'application/json', :Accept => 'application/json' }
  parameters = table.rows.flatten
  @payload_hash = {
    "id": "#{@saved_pet_id}".to_i,
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
  json_payload_hash = @payload_hash.to_json
  @response = send_put(url, json_payload_hash, headers_hash)
end

When(/^Обновил информацию о животном по сохраненному id$/) do
  steps %{* Отправил PUT запрос на URL `https://petstore.swagger.io/v2/pet` и параметрами:
    | key           | value            |
    | id            | #{@saved_pet_id} |
    | category id   | 2                |
    | category name | updated          |
    | name          | updated          |
    | photoUrls     | updated          |
    | tags id       | 2                |
    | tags name     | updated          |
    | status        | sold             |}
end
