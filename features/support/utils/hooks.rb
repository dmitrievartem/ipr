Before('@ui') do
  # Указываю пути до портативного браузера и хромдрайвера
  Selenium::WebDriver::Chrome::Service.driver_path = 'features/support/GoogleChromePortable/chromedriver.exe'
  path_to_browser = get_filepath('features/support/GoogleChromePortable/App/Chrome-bin/chrome.exe')
  # path_to_browser = 'features/support/GoogleChromePortable/App/Chrome-bin/chrome.exe'
  options = Selenium::WebDriver::Chrome::Options.new(binary: path_to_browser)
  @browser = Selenium::WebDriver.for :chrome, options: options
  # Неявное ожидание
  @browser.manage.timeouts.implicit_wait = 5
end

After('@ui') do |scenario|
  if scenario.failed?
    add_screenshot
    add_browser_logs
  end
  @browser.quit
end

After('not @ui') do |scenario|
  if scenario.failed?
    add_rest_logs
  end
end

def add_screenshot
  time = Time.now.to_s.gsub! ':', '-'
  time = time.gsub! ' ', '-'
  file_path = 'report_files/screenshots/screenshot' + time + '.png'
  @browser.save_screenshot(file_path)
  image = open(file_path, 'rb', &:read)
  encoded_image = Base64.encode64(image)
  embed(encoded_image, 'image/png')
end

def add_browser_logs
  time_now = Time.now
  # Getting current URL
  current_url = @browser.current_url.to_s
  # Gather browser logs
  logs = @browser.manage.logs.get(:browser).map {|line| [line.level, line.message]}
  # Remove warnings and info messages
  logs.reject! { |line| ['WARNING', 'INFO'].include?(line.first) }
  logs.any? == true
  embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + ( "Current URL: " + current_url + "\n") + logs.join("\n"), 'text/plain', 'BROWSER ERROR')
end

def add_rest_logs
  time_now = Time.now
  request_logs = log_request(@request).to_s
  response_logs = log_response(@response).to_s
  embed(time_now.strftime('%Y-%m-%d-%H-%M-%S' + "\n") + request_logs + "\n" + response_logs + "\n", 'text/plain', 'BROWSER ERROR')
end