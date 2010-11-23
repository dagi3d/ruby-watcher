require File.join(File.dirname(__FILE__), '..', 'init')

class Foo
  def self.call(env)
    case env['PATH_INFO']
    when "/"
      html
    when "/snapshot.jpg"
      image
    end
  end
  
  def self.html
    out = <<-html
      <html>
        <head>
          <meta http-equiv="refresh" content="#{Watcher::Config['capture']['time']}" />
        </head>
        <body>
          <img src="/snapshot.jpg?r=#{Time.new.to_i}" />
        </body>
      </html>
    html
    [200, { "Content-Type" => "text/html" }, [out]]  
  end

  def self.image
    [200, { "Content-Type" => "image/jpeg" }, [Watcher::Capture.last_capture]]  
  end
  
  def to_i
    
  end
end  

use Rack::Auth::Basic, "ruby-watcher" do |username, password|
  [username, password] == [Watcher::Config['web']['username'], Watcher::Config['web']['password']]
end
run Foo