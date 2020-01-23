require "logger"

class AppLogger
  def initialize(app, **options)
    @app = app
    @logger = Logger.new(STDOUT)
  end

  def call(env)
    @logger.info(env)
    @app.call(env)
  end
end
