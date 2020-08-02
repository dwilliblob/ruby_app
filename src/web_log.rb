class WebLog
  attr_accessor :url, :ip_address

  def initialize(url = '', ip_address = '')
    @url = url
    @ip_address = ip_address
  end

  def most_page_views(log_array_objects)
    result = Hash[ log_array_objects.group_by{ |log_array_objects| log_array_objects.url }.map{ |k,v| [k,v.size] } ]
  end

  
end
