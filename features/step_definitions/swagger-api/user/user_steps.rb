When(/^Отправил POST запрос для создания пользователя на URL `(.*)` c параметрами:$/) do |url, table|
  headers_hash = { 'Content-Type' => 'application/json', :Accept => 'application/json'}
  p '!!!!!!!!!!!!!!!!!!!!!'
  @payload_hash = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }
  table.hashes.each { |i| eval "@payload_hash#{i[:key]} = '#{i[:value]}'" }
  @payload_hash[:id] = @payload_hash[:id].to_i
  @payload_hash[:userStatus] = @payload_hash[:userStatus].to_i
  @payload_hash = @payload_hash.deep_transform_keys(&:to_s)
  p '!!!!!!!!!!!!'
  pp @payload_hash
  json_payload_hash = @payload_hash.to_json
  @response = send_post(url, json_payload_hash, headers_hash)
  pp @response.body.to_s
end

Then(/^Запомнил id и username созданного пользователя из запроса$/) do
  @saved_user_id = @response["message"]
  p "saved_user_id: #{@saved_user_id}"
  @saved_username = @payload_hash["username"]
  p "saved_username: #{@saved_username}"
end

Then(/^Убедился, что пользователь в ответе соответствует отправленным данным$/) do
  @payload_hash[:id] = @saved_user_id.to_i
  hash_compare = @payload_hash.deep_transform_keys(&:to_s).eql?(@response)
  if hash_compare == false
    p 'REQUEST USER: '
    pp @payload_hash.deep_transform_keys(&:to_s)
    p 'RESPONSE USER:'
    pp @response
  end
  expect(hash_compare).to be true
end

Then(/^Убедился, что есть пользователь с сохраненным id по сохраненному username$/) do
  step "Отправил GET запрос на URL `https://petstore.swagger.io/v2/user` c path параметром: `#{@saved_username}`"
  step "Убедился, что код REST ответа = `200`"
  step "Распарсил JSON ответ"
  step "Убедился, что пользователь в ответе соответствует отправленным данным"
end

Then(/^Удалил пользователся по сохраненному username$/) do
  step "Отправил DELETE запрос на URL `https://petstore.swagger.io/v2/user` c path параметром `#{@saved_username}`"
  step "Убедился, что код REST ответа = `200`"
end

Then(/^Убедился, что удалил пользователя по сохраненному username$/) do
  step "Отправил GET запрос на URL `https://petstore.swagger.io/v2/user` c path параметром: `#{@saved_username}`"
  step "Убедился, что код REST ответа = `404`"
end

Then(/^Создал пользователя со случайными id и username$/) do
  rand_username = rand
  steps %{* Отправил POST запрос для создания пользователя на URL `https://petstore.swagger.io/v2/user` c параметрами:
      | key           | value            |
      | [:id]         |                  |
      | [:username]   | #{rand_username} |
      | [:firstName]  | string           |
      | [:lastName]   | string           |
      | [:email]      | string           |
      | [:password]   | string           |
      | [:phone]      | string           |
      | [:userStatus] | 0                |}
end

Then(/^Создал пользователя с сохраненным id и случайным username$/) do
  rand_username = rand
  steps %{* Отправил POST запрос для создания пользователя на URL `https://petstore.swagger.io/v2/user` c параметрами:
      | key           | value             |
      | [:id]         | #{@saved_user_id} |
      | [:username]   | #{rand_username}  |
      | [:firstName]  | string            |
      | [:lastName]   | string            |
      | [:email]      | string            |
      | [:password]   | string            |
      | [:phone]      | string            |
      | [:userStatus] | 0                 |}
end

Then(/^Убедился, что отправленный и полученный id совпадают$/) do
  expect(@saved_user_id).to eq @response["message"]
end

Then(/^Создал пользователя с сохраненным username$/) do
  steps %{* Отправил POST запрос для создания пользователя на URL `https://petstore.swagger.io/v2/user` c параметрами:
      | key           | value              |
      | [:id]         |                    |
      | [:username]   | #{@saved_username} |
      | [:firstName]  | string             |
      | [:lastName]   | string             |
      | [:email]      | string             |
      | [:password]   | string             |
      | [:phone]      | string             |
      | [:userStatus] | 0                  |}
end

Then(/^Создал пользователя с сохраненными id и username$/) do
  steps %{* Отправил POST запрос для создания пользователя на URL `https://petstore.swagger.io/v2/user` c параметрами:
      | key           | value              |
      | [:id]         | #{@saved_user_id}  |
      | [:username]   | #{@saved_username} |
      | [:firstName]  | string             |
      | [:lastName]   | string             |
      | [:email]      | string             |
      | [:password]   | string             |
      | [:phone]      | string             |
      | [:userStatus] | 0                  |}
end