class App
  def call(env)
    @params = FormatParams.new(env["QUERY_STRING"])
    [
      status,
      headers,
      body
    ]
  end

  def status
    @params.errors.empty? ? 200 : 400
  end

  def headers
    { 
      'Content-Type' => 'text/plain',
      'X-Version' => Version::VERSION,
      'X-Codename' => Version::CODENAME
    }
  end

  def body
    @params.get_body
  end
end
