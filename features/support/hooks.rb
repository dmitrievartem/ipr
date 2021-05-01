Before('@ui') do |scenario|
  Selenium::WebDriver::Chrome::Service.driver_path = 'chromedriver.exe'
  if ENV['ABSOLUTE_PATH'] == true
    path_to_browser = 'D:\Ruby\RubyMine 2020.3.1\RubymineProjects\ipr\features\support\utils\GoogleChromePortable\App\Chrome-bin\chrome.exe'
  else
    path_to_browser = './features/support/utils/GoogleChromePortable/App/Chrome-bin'
    path_to_browser = '\\ features \\ support \\ utils \\ GoogleChromePortable \\ App \\ Chrome-bin \\ chrome.exe'
    # path_to_browser = Dir.pwd + '/features/support/utils/GoogleChromePortable/App/Chrome-bin/chrome.exe'
    # p 'BEFORE'
    # p path_to_browser
    # path_to_browser["C:"]= "/c"
    # p 'AFTER'
    # p path_to_browser
  end

  # попробовать поменять слэши
  # ПРОВЕРИТЬ
  #
  options = Selenium::WebDriver::Chrome::Options.new(binary: path_to_browser)
  @browser = Selenium::WebDriver.for :chrome, options: options
  @browser.manage.window.maximize
  @browser.manage.timeouts.implicit_wait = 5
  # @browser = nil
  if @browser == nil
    skip_this_scenario
  end

end

Before do |scenario|
  @counter = 0
  @scenario_name = scenario.name
  if ENV['DbLogEnable'] == 'true'
    @connection = Mysql2::Client.new(host:     "localhost",
                                     username: "dmitrievas",
                                     password: "art.KS2733",
                                     database: "ipr",
                                     port:     3306)
  end
end

After('@ui') do |scenario|
  if scenario.failed?
    # ЕСЛИ БРАУЗЕР nil, то не выполнять код
    # делать отчет если сборка success
    # запуск по расписанию
    # Post User
    # Post list User
    add_screenshot
    add_browser_logs
  end
  if @browser != nil
    @browser.quit
  end
end

After('not @ui') do |scenario|
  if scenario.failed?
    add_rest_logs
  end
end

AfterStep do |_result, step|
  @counter += 1
  @step_name = step.text
  if ENV['DbLogEnable'] == 'true'
    error = ''
    @connection.query("INSERT INTO AutotestLog (log_time, scenario, step, result, error) VALUES ('#{Time.now}', '#{@scenario_name}', '#{step.text}', 'passed', '#{error}');")
  end
end

After('@all') do |scenario|
  if scenario.failed?
    error = scenario.exception
    arr_of_steps = scenario.test_steps.map(&:text).delete_if { |item| item.include? 'hook' }
    if ENV['DbLogEnable'] == 'true'
      @connection.query("INSERT INTO AutotestLog (log_time, scenario, step, result, error) VALUES ('#{Time.now}', '#{@scenario_name}', '#{arr_of_steps[@counter]}', 'failed', '#{error}');")
    end
  end
end

def add_screenshot
  time = Time.now.to_s.gsub! ':', '-'
  time = time.gsub! ' ', '-'
  file_path = 'report_files/screenshots/screenshots' + time + '.png'
  @browser.save_screenshot(file_path)
  embed(file_path, 'image/png')
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