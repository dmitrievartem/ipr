When(/^Открыл страницу `(.*)`$/) do |url|
  @browser.navigate.to(url)
end

Then(/^Нашел элемент по xpath: `(.*)`$/) do |xpath_locator|
  @browser.find_element(:xpath, xpath_locator)
end