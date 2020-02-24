require_relative "lib/format_params"

require_relative "middleware/app_logger"
require_relative "middleware/dispath"
require_relative "app"
require_relative "lib/version"

# use AppLogger
use Rack::Static, :urls => ["/public"]
use Dispath
run App.new
