Then(/^Убедился, что в ответе для всех животных параметр `(.*)` равен `(.*)`$/) do |parameter, expected_value|
  @response.each do |pet_info|
    expect(pet_info["#{parameter}"]).to eq(expected_value)
  end
end

Then(/^Убедился, что в ответе есть животное с сохраненным id$/) do
    @payload_hash[:id] = @saved_pet_id
    expect(@response).to include @payload_hash.deep_transform_keys(&:to_s)
end