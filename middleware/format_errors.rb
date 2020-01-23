class FormatErrors
  AVAILABLE_FORMATS = %w[year month day hour minute second]

  def initialize(app)
    @app = app
  end

  def call(env)
    formats = parse(env["QUERY_STRING"])
    errors = format_errors(formats)
    errors.empty? ? @app.call(env) : falure(errors)
  end

  def parse(query)
    query.split('=')[-1].split('%2C')
  end

  def format_errors(formats)
    errors = []
    formats.map { |format| errors << format unless AVAILABLE_FORMATS.include?(format) }
    errors
  end

  def falure(errors)
    [
      400,
      { "Content-Type" => "text/plain"},
      ["Unknown time format [#{errors.join(', ')}]"]
    ]
  end
end
