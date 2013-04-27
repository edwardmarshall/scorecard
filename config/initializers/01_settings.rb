require 'ostruct'
require 'active_support/core_ext'
#TODO: lots of repitition here, can we create a file loading abstraction?

AppConfig = OpenStruct.new

settings = YAML.load(File.read(File.join(Rails.root, 'config/settings.yml')))

AppConfig.settings = settings[Rails.env.to_sym]
