class Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/custom_log.rake'
  end

  initializer "declare custome loggoer" do
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
  end
end
