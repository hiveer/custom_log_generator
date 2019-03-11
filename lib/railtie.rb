class Railtie < Rails::Railtie
  rake_tasks do
    load 'tasks/custom_log.rake'
  end
end
