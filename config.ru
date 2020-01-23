require_relative "lib/format_params"

require_relative "middleware/app_logger"
require_relative "middleware/dispath"
require_relative "middleware/format_errors"
require_relative "app"

# use AppLogger
use Dispath
use FormatErrors
run App.new
