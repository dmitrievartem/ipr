When(/^Отправил POST запрос для создания заказа на URL `(.*)` c параметрами:$/) do |url, table|
  headers_hash = { 'Content-Type' => 'application/json', :Accept => 'application/json' }
  @payload_hash = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
  table.hashes.each do |i|
    case i[:value]
    when 'true'
      eval "@payload_hash#{i[:key]} = true"
    when 'false'
      eval "@payload_hash#{i[:key]} = false"
    else
      eval "@payload_hash#{i[:key]} = '#{i[:value]}'"
    end
  end
  json_payload_hash = @payload_hash.to_json
  @response = send_post(url, json_payload_hash, headers_hash)
end

When(/^Создал заказ на животное по сохраненному id животного$/) do
  steps %{* Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
          | key         | value                        |
          | [:id]       |                              |
          | [:petId]    | #{@saved_pet_id}             |
          | [:quantity] | 1                            |
          | [:shipDate] | 2021-04-24T17:01:30.009+0000 |
          | [:status]   | placed                       |
          | [:complete] | true                         |}
end

When(/^Создал заказ на животное по сохраненному id животного с параметром status = `(.*)` и complete = `(.*)`$/) do |status, complete|
  steps %{* Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
          | key         | value                        |
          | [:id]       |                              |
          | [:petId]    | #{@saved_pet_id}             |
          | [:quantity] | 1                            |
          | [:shipDate] | 2021-04-24T17:01:30.009+0000 |
          | [:status]   | #{status}                    |
          | [:complete] | #{complete}                  |}
end

Then(/^Запомнил id созданного заказа$/) do
  @saved_order_id = @response["id"].to_i
end

When(/^Убедился, что заказ в ответе соответствует запросу по сохраненному id$/) do
  @payload_hash[:id] = @saved_order_id
  transformed_payload_hash = @payload_hash.deep_transform_keys(&:to_s).clone
  transformed_payload_hash["petId"] = transformed_payload_hash["petId"].to_i
  transformed_payload_hash["quantity"] = transformed_payload_hash["quantity"].to_i
  hash_compare = transformed_payload_hash.eql?(@response)
  if hash_compare == false
    p 'REQUEST ORDER: '
    pp @payload_hash.deep_transform_keys(&:to_s)
    p 'RESPONSE ORDER:'
    pp @response
  end
  expect(hash_compare).to be true
end
