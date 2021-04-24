def send_get(url, headers = {})
  log_request(url, headers)
  RestClient::Request.execute(method: :get, url: url, headers: headers) do |response, _request, _result|
    @response = response
    log_response(response)
    case response.code
    when 301, 302, 307
      @response = response.follow_redirection
    else
      @response = response
    end
  end
end

def send_post(url, payload, headers = {})
  log_request(url, headers, payload)
  RestClient::Request.execute(method: :post, url: url, headers: headers, payload: payload) do |response, _code|
    @response = response
    log_response(response)
  end
  @response
end

def send_put(url, payload, headers = {})
  log_request(url, headers, payload)
  RestClient::Request.execute(method: :put, url: url, headers: headers, payload: payload) do |response, _code|
    @response = response
    log_response(response)
  end
  @response
end

def send_delete(url, headers = {})
  log_request(url, headers)
  RestClient::Request.execute(method: :delete, url: url, headers: headers) do |response, _request, _result|
    @response = response
    log_response(response)
    case response.code
    when 301, 302, 307
      @response = response.follow_redirection
    else
      @response = response
    end
  end
end

def log_request(url, headers, payload = {})
  Kernel.puts 'REQUEST LOG'
  Kernel.puts 'URL: '
  pp url
  Kernel.puts 'PAYLOAD: '
  pp payload
  Kernel.puts 'HEADERS: '
  pp headers
end

def log_response(response)
  Kernel.puts 'RESPONSE LOG'
  Kernel.puts 'CODE: '
  pp response.code
  Kernel.puts 'HEADERS: '
  pp response.headers
  Kernel.puts 'BODY: '
  response =  JSON.parse response
  pp response
end