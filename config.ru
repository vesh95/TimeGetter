require_relative "middleware/app_logger"
require_relative "app"

use AppLogger
run App.new
