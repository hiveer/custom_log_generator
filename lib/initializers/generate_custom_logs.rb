class CustomLogger < ActiveSupport::Logger
  def initialize(*args)
    super(*args)
    @formatter = formatter
  end

  def formatter
    Proc.new{|severity, time, progname, msg|
      formatted_severity = sprintf("%-5s",severity.to_s)
      formatted_time = time.strftime("%Y-%m-%d %H:%M:%S")
      "[#{formatted_time}] => #{msg}\n"
    }
  end
end

def logger_from_path path
  /\Alog\/(?<logger_name>.*)\.log\Z/ =~ path
  "#{logger_name}_logger"
end

path_list = YAML.load_file("#{Rails.root}/config/custom_logs.yml")

path_list.each do |log_path|
  logger_name = logger_from_path log_path
  eval("#{logger_name.upcase} = CustomLogger.new(log_path)")
end

