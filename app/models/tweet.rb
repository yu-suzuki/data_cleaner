module Tweet
  class Base < ActiveRecord::Base
    databases = YAML.load(ERB.new(File.read('config/tweet/database.yml')).result)
    establish_connection(databases[Rails.env])
    self.abstract_class = true
  end
end