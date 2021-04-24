Then(/^Убедился, что в ответе для всех животных параметр `(.*)` равен `(.*)`$/) do |parameter, expected_value|
  @response.each do |pet_info|
    expect(pet_info["#{parameter}"]).to eq(expected_value)
  end
end