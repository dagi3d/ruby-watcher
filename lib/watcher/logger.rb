module Watcher
  class Logger
    def self.log(message)
      @@logger ||= ::Logger.new(STDOUT)
      @@logger.info(message)
    end
  end
end