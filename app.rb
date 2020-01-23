class App
  TIME_METHODS = {
    year: :year,
    month: :month,
    day: :day,
    hour: :hour,
    minute: :min,
    second: :sec
  }

  def call(env)
    [
      200,
      { 'Content-Type' => 'text/plain' },
      [body(env)]
    ]
  end

  def body(env)
    formats = FormatParams.parse(env["QUERY_STRING"])
    get_values(formats).join('-')
  end

  def get_values(formats)
    formats.map { |format| Time.now.send(TIME_METHODS[format.to_sym]) }
  end
end
