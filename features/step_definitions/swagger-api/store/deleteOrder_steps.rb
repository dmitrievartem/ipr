When(/^Отправил DELETE запрос на URL `(.*)` c сохраненным id заказа$/) do |url|
  headers_hash = { Accept: 'application/json' }
  url = url.concat('/' + @saved_order_id.to_s)
  @response = send_delete(url, headers_hash)
end

Then(/^Убедился, что нет заказа с сохраненным id$/) do
  step "Отправил GET запрос на URL `https://petstore.swagger.io/v2/pet` c path параметром: `#{@saved_order_id}`"
  step "Убедился, что код REST ответа = `404`"
  step "Распарсил JSON ответ"
  step "Убедился, что в REST ответе поле `message` равно `Order not found`"
end