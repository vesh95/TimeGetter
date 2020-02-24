class FormatParams
  TIME_METHODS = {
    year: '%Y',
    month: '%m',
    day: '%d',
    hour: '%H',
    minute: '%M',
    second: '%S'
  }

  AVAILABLE_FORMATS = %w[year month day hour minute second]

  def initialize(query)
    @time_formats = parse(query)
    @errors = []
    validate_format!
  end

  def get_body
    if @errors.empty?
      success
      # @time_formats.map { |format| Time.now.send(TIME_METHODS[format.to_sym]) }
    else
      falure
    end
  end

  def errors
    @errors
  end

  private

  def falure
    ["Unknown time format [#{@errors.join(', ')}]"]
  end

  def success
    [formated_time]
  end

  def validate_format!
    @time_formats.map { |format| @errors << format unless AVAILABLE_FORMATS.include?(format) }
  end

  def parse(query)
    query.split('=')[-1].split('-')
  end

  def split_format
    @time_formats.map { |format| TIME_METHODS[format.to_sym] }.join('-')
  end

  def formated_time
    Time.now.strftime(split_format)
  end
end
