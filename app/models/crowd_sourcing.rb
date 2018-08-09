module CrowdSourcing
  class Base < ActiveRecord::Base
    databases = YAML.load(ERB.new(File.read('config/crowdsourcing/database.yml')).result)
    establish_connection(databases[Rails.env])
    self.abstract_class = true
  end
end