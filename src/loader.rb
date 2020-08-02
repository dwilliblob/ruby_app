require_relative "./web_log.rb"

class Loader
  attr_accessor :web_log

  def initialize(web_log = [])
    @web_log = web_log
  end

  def parse_file(filename)
    File.foreach(filename) { |line|
      fragments = line.split(' ')
      wl = WebLog.new
      wl.url = fragments[0]
      wl.ip_address = fragments[1]
      @web_log.push(wl)
    }
    return @web_log
  end
end
