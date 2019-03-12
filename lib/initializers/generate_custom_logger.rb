# read config from custom_logs.yml and create each custom Logger

def logger_from_path path
  /\Alog\/(?<logger_name>.*)\.log\Z/ =~ path
  "#{logger_name}_logger"
end

path_list = YAML.load_file("#{Rails.root}/config/custom_logs.yml")

path_list.each do |log_path|
  logger_name = logger_from_path log_path
  eval("#{logger_name.upcase} = CustomLogger.new(log_path)")
end

