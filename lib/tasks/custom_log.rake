namespace :custom_log do
  desc 'Install custom log'

  task :install do
    # copy config file to "#{Rails.root}/config/"
    puts "copy lib/config/custom_logs.yml to Rails.root/config ..."
    source_config_file = File.join(Gem.loaded_specs["custom_log_generator"].full_gem_path, "lib", "config", "custom_logs.yml")
    target_config_file = File.join(Rails.root, "config", "custom_logs.yml")
    FileUtils.cp_r source_config_file, target_config_file
    puts "done for custom_logs.yml copy"

    # copy initializer filer to "#{Rails.root}/config/initialziers/"
    puts "copy lib/initializers/generate_custom_logger.rb to Rails.root/config/initializers ..."
    source_config_file = File.join(Gem.loaded_specs["custom_log_generator"].full_gem_path, "lib", "initializers", "generate_custom_logger.rb")
    target_config_file = File.join(Rails.root, "config", "initializers", "generate_custom_logger.rb")
    FileUtils.cp_r source_config_file, target_config_file
    puts "all done, enjoy!"
  end
end
