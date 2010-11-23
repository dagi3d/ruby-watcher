module Watcher
  class Database
    def self.instance
      @@db ||= CouchRest.new(Watcher::Config['db']['host'])
          .database!(Watcher::Config['db']['database'])
      @@db
    end
  end
end