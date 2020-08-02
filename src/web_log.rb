class WebLog
  attr_accessor :url, :ip_address

  def initialize(url = '', ip_address = '')
    @url = url
    @ip_address = ip_address
  end

  def most_page_views(log_array_objects)
    result = Hash[ log_array_objects.group_by{ |log_array_objects| log_array_objects.url }.map{ |k,v| [k,v.size] }.sort_by{ |_key, value| value }.reverse ]
  end

  def unique_page_views(log_array_objects)
    log_array_objects = log_array_objects.sort_by { |a| [ a.url, a.ip_address ] }
    uniq_urls = log_array_objects.map(&:url).uniq
    results = []
    uniq_urls.each do |uniq_url|
      grouped_rows = log_array_objects.select { |log_array_objects| log_array_objects.url == uniq_url }
      count_by_unique_ip_address = grouped_rows.map(&:ip_address).uniq.count
      results << [uniq_url, count_by_unique_ip_address]
    end
    results = results.sort! { |a, b| b<=>a }
  end
end
