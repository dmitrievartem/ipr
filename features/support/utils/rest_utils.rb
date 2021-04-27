def send_get(url, headers = {})
  @request = { url: url, headers: headers, payload: {} }
  log_request(@request)
  RestClient::Request.execute(method: :get, url: url, headers: headers) do |response|
    @response = response
    log_response(response)
  end
end

def send_post(url, payload, headers = {})
  @request = {url: url, headers: headers, payload: payload}
  log_request(@request)
  RestClient::Request.execute(method: :post, url: url, headers: headers, payload: payload) do |response|
    @response = response
    log_response(response)
  end
  @response
end

def send_put(url, payload, headers = {})
  @request = {url: url, headers: headers, payload: payload}
  log_request(@request)
  RestClient::Request.execute(method: :put, url: url, headers: headers, payload: payload) do |response|
    @response = response
    log_response(response)
  end
  @response
end

def send_delete(url, headers = {})
  @request = {url: url, headers: headers, payload: {} }
  log_request(@request)
  RestClient::Request.execute(method: :delete, url: url, headers: headers) do |response|
    @response = response
    # log_response(response)
  end
end

def log_request(request)
  Kernel.puts 'REQUEST LOG'
  Kernel.puts 'URL: '
  pp request[:url]
  Kernel.puts 'PAYLOAD: '
  pp request[:payload]
  Kernel.puts 'HEADERS: '
  pp request[:headers]
  returned_value = 'REQUEST LOG' + "\n" + 'URL: ' + request[:url].to_s + "\n"
  returned_value += 'PAYLOAD: ' + request[:payload].to_s + "\n"
  returned_value += 'HEADERS: ' + request[:headers].to_s + "\n"
  returned_value
end

def log_response(response = {})
  # Kernel.puts 'RESPONSE LOG'
  # Kernel.puts 'CODE: '
  # pp response.code
  # Kernel.puts 'HEADERS: '
  # pp response.headers
  # Kernel.puts 'BODY: '
  # pp response.body
  # json_response =  JSON.parse response
  # pp json_response
  # returned_value = 'RESPONSE LOG' + "\n" + 'CODE: ' + response.code.to_s + "\n"
  # returned_value += 'HEADERS: ' + response.headers.to_s + "\n"
  # returned_value += 'BODY: ' + response.body.to_s + "\n"
  # returned_value
end