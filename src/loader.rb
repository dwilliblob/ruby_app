require_relative "./web_log.rb"

class Loader

  def parse_file(filename)
    web_log = []
    File.foreach("webserver.log") { |line|
      fragments = line.split(' ')
      wl = WebLog.new
      wl.url = fragments[0]
      wl.ip_address = fragments[1]
      web_log.push(wl)
    }
    return web_log
  end

end
