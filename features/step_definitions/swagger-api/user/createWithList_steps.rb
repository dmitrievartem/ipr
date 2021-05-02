When(/^Отправил POST запрос со списком из `(.*)` пользователей на URL `(.*)`$/) do |n, url|
  headers_hash = { 'Content-Type' => 'application/json', :Accept => 'application/json' }
  @payload_hash = []
  @username_arr = []
  counter = 0

  while counter < n.to_i do
    rand_username = rand
    user = {
      "id": "",
      "username": "#{rand_username}",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    @payload_hash << user
    @username_arr << rand_username
    counter += 1
  end

  json_payload_hash = @payload_hash.to_json
  @response = send_post(url, json_payload_hash, headers_hash)
end

When(/^Убедился, что существуют пользователи по созданному списку$/) do
  i = 0
  while i < @username_arr.length do
    step "Отправил GET запрос на URL `https://petstore.swagger.io/v2/user` c path параметром: `#{@username_arr[i]}`"
    step "Убедился, что код REST ответа = `200`"
    step "Распарсил JSON ответ"
    step "Запомнил id пользователя из ответа на GET запрос по username"
    @payload_hash[i][:id] = @saved_user_id.to_i
    pp @payload_hash[i]
    expect(@payload_hash[i].deep_transform_keys(&:to_s)).to match(@response)
    i += 1
  end
end

Then(/^Запомнил id пользователя из ответа на GET запрос по username$/) do
  @saved_user_id = @response["id"]
  p "saved_user_id: #{@saved_user_id}"
end

When(/^Удалил созданных пользователей по списку$/) do
  i = 0
  while i < @username_arr.length do
    @saved_username = @username_arr[i]
    step "Удалил пользователся по сохраненному username"
    step "Убедился, что код REST ответа = `200`"
    i += 1
  end
end

When(/^Убедился, что нет пользователей по списку имен$/) do
  i = 0
  while i < @username_arr.length do
    step "Отправил GET запрос на URL `https://petstore.swagger.io/v2/user` c path параметром: `#{@username_arr[i]}`"
    step "Убедился, что код REST ответа = `404`"
    i += 1
  end
end

When(/^Подготовил список из `(.*)` пользователей$/) do |n|
  @payload_hash = []
  @username_arr = []
  counter = 0

  while counter < n.to_i do
    rand_username = rand
    user = {
      "id": "",
      "username": "#{rand_username}",
      "firstName": "string",
      "lastName": "string",
      "email": "string",
      "password": "string",
      "phone": "string",
      "userStatus": 0
    }
    @payload_hash << user
    @username_arr << rand_username
    counter += 1
  end
end

When(/^Добавил в список невалидного пользователя$/) do |table|
  user_hash = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
  table.hashes.each { |i| eval "user_hash#{i[:key]} = '#{i[:value]}'" }
  user_hash = user_hash.deep_transform_keys(&:to_s)
  @payload_hash << user_hash
  @username_arr << user_hash["username"]
end

When(/^Отправил POST запрос с подготовленным списком пользователей на URL `(.*)`$/) do |url|
  headers_hash = { 'Content-Type' => 'application/json', :Accept => 'application/json' }
  json_payload_hash = @payload_hash.to_json
  @response = send_post(url, json_payload_hash, headers_hash)
end