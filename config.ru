require_relative "lib/format_params"

require_relative "middleware/app_logger"
require_relative "middleware/dispath"
require_relative "app"

# use AppLogger
use Dispath
run App.new
