require 'webrick'
require 'json'
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick.html
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick/HTTPRequest.html
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick/HTTPResponse.html
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick/Cookie.html


server = WEBrick::HTTPServer.new(Port: 3000)


server.mount_proc("/") do |req, res|
  res.content_type = "text/text"
  res.body = "#{req.request_line.split(" ")[1]}"
end

trap('INT') { server.shutdown }

server.start
