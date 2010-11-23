require 'spec_helper'

describe Watcher::Capture do
  
  before(:each) do
    Watcher::Config['db'] = {
      'host' => 'localhost:5984',
      'database' => 'ruby-watcher'
    }
    
    Watcher::Config['capture'] = {
      'command' => 'isightcapture /tmp/foo.jpg'
    }
  end
  
  it "should retrieve the last capture" do
    attachment = Watcher::Capture.last_capture
  end
end