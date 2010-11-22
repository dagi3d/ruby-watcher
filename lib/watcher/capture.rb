# Watcher
#
module Watcher
  
  # Capture
  #
  class Capture < CouchRest::Document
    
    # initialize
    #
    def initialize
      file = Watcher::Command.capture
      self.put_attachment('foo', file)
      #self['_attachments']['foo'] = {
      #  'type' => 'image/jpeg',
      #  'data' => ''
      #}
    end
  end
end