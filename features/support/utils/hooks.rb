Before('@ui') do
  Selenium::WebDriver::Chrome::Service.driver_path = 'features/support/GoogleChromePortable/chromedriver.exe'
  path_to_browser = 'features/support/GoogleChromePortable/App/Chrome-bin/chrome.exe'
  options = Selenium::WebDriver::Chrome::Options.new(binary: path_to_browser)
  @browser = Selenium::WebDriver.for :chrome, options: options
  @browser.manage.timeouts.implicit_wait = 5
end

After('@ui') do
  @browser.quit
end