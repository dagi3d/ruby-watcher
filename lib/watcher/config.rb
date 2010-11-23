module Watcher
  # Watcher::Config
  #
  class Config
    @@options = {}
    
    def self.[](key)
      @@options[key]
    end
    
    def self.[]=(key,value)
      @@options[key] = value
    end
    
    def self.load(file)
      @@options = YAML.load(File.new(file))
    end
  end
  
end