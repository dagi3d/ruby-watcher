module Watcher
  class Command
    def self.run
      output = `#{Watcher::Config['capture']['command']}`
    end
  end
end