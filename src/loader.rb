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

  def load_webserver_log_reports
    input_filename = ARGV[0]
    logs = Loader.new.parse_file(input_filename)
    wl = WebLog.new

    most_page_views = wl.most_page_views(logs)
    puts "-" * 100
    puts "Ranked most viewed pages"
    puts "-" * 100
    most_page_views.each do |k,v|
      puts "#{k} = #{v}"
    end
    puts "-" * 100
    puts ""

    unique_page_views = wl.unique_page_views(logs)
    puts "-" * 100
    puts "Number of unique page views"
    puts "-" * 100
    unique_page_views.each do |page_view|
      puts "#{page_view[0]} = #{page_view[1]}"
    end
    puts "-" * 100
  end
end
