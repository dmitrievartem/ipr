When(/^Отправил POST запрос для создания заказа на URL `(.*)` c параметрами:$/) do |url, table|
  headers_hash = { 'Content-Type' => 'application/json', :Accept => 'application/json' }
  payload_hash = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
  table.hashes.each do |i|
    case i[:value]
    when 'true'
      eval "payload_hash#{i[:key]} = true"
    when 'false'
      eval "payload_hash#{i[:key]} = false"
    else
      eval "payload_hash#{i[:key]} = '#{i[:value]}'"
    end
  end
  pp payload_hash
  payload_hash = payload_hash.to_json
  @response = send_post(url, payload_hash, headers_hash)
end

Then(/^Создал заказ на животное$/) do
  steps %{* Отправил POST запрос для создания заказа на URL `https://petstore.swagger.io/v2/store/order` c параметрами:
          | key         | value                    |
          | [:id]       | 9999345                  |
          | [:petId]    | 9999456                  |
          | [:quantity] | 1                        |
          | [:shipDate] | 2021-04-24T17:01:30.009Z |
          | [:status]   | placed                   |
          | [:complete] | true                     |}
end

Then(/^Запомнил id созданного заказа$/) do
  @saved_order_id = @response["id"].to_i
end
