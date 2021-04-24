When(/^Отправил DELETE запрос на URL `(.*)` c сохраненным id заказа$/) do |url|
  headers_hash = { Accept: 'application/json' }
  url = url.concat('/' + @saved_order_id.to_s)
  @response = send_delete(url, headers_hash)
end