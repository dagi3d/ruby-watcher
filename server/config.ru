def html
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

def image
  
  [200, { "Content-Type" => "image/jpeg" }, [Watcher::Capture.last_capture]]  
end

require File.join(File.dirname(__FILE__), '..', 'init')
app = proc do |env|
  case env['PATH_INFO']
  when "/"
    html
  when "/snapshot.jpg"
    image
  end
end
run app