module Watcher
  class Command
    def self.capture
      file = '/tmp/foo.jpg'
      output = `isightcapture #{file}`
      file
    end
  end
end