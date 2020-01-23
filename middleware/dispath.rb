class Dispath
  def initialize(app)
    @app = app
  end

  def call(env)
    env["PATH_INFO"].downcase.gsub(/\//, '') == 'time' ? @app.call(env) : error_page_404
  end

  def error_page_404
    [
      404,
      { "Content-Type" => "text/plain" },
      ['Unknown path | Error 404']
    ]
  end
end
