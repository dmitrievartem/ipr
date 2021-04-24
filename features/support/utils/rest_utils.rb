RestClient.add_before_execution_proc do |params|
  params[:verify_ssl] = false
end

def send_get(path, headers = {})
  url = path
  RestClient::Request.execute(method: :get, url: url, headers: headers, verify_ssl: false) do |response, _request, _result|
    @response = response
    case response.code
    when 301, 302, 307
      @response = response.follow_redirection
    else
      @response = response
    end
  end
end

def send_post(url, payload, headers = {})
  RestClient::Request.execute(method: :post, url: url, headers: headers, payload: payload, verify_ssl: false) do |response, _code|
    @response = response
  end
  @response
end

def send_delete(path, headers = {})
  RestClient::Request.execute(method: :delete, url: path, headers: headers, verify_ssl: false) do |response, _request, _result|
    @response = response
    case response.cod
    when 301, 302, 307
      @response = response.follow_redirection
    else
      @response = response
    end
  end
end

def log_request(url, payload, headers)
  p 'ПАРАМЕТРЫ ЗАПРОСА:'
  p url
  p payload
  p headers
end

def log_response(response)
  p 'ПАРАМЕТРЫ ОТВЕТА:'
  p "response_code = #{response.code} "
  pp "response_head = #{response.headers} "
  pp "response_body = #{JSON.parse(response.body)} "
end