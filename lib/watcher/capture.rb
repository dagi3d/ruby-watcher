# Watcher
#
module Watcher
  
  # Capture
  #
  class Capture < CouchRest::Document
    
    # Capture.capture!
    #
    def self.create!
      file = Watcher::Config['capture']['tmp_file']
      now = Time.new

      output = Watcher::Command.run
            
      capture = Watcher::Capture.new
      capture['_id'] = now.to_i.to_s
      capture['doc_type'] = 'capture'
      capture['output'] = output
      capture['created_at'] = {
        :year  => now.year,
        :month => now.month,
        :day   => now.day,
        :hour  => now.hour,
        :min   => now.min,
        :sec   => now.sec
      }
      
      capture.database = Watcher::Database.instance
      capture.save
      capture.put_attachment('pic', File.new(file), 'Content-Type' => 'image/jpg')
      File.delete(file)
      Watcher::Logger.log("snapshot taken at #{now}")
    end

    def self.last
      db = Watcher::Database.instance
      rows = db.documents(:limit => 1, :include_docs => true, :descending => true)['rows']
      rows.first
    end
    
    def self.attachment(doc, name)
      db = Watcher::Database.instance
      db.fetch_attachment(doc, name)      
    end
    
    def self.last_capture
      capture = self.last
      self.attachment(capture['id'], 'pic')
    end
  end
end