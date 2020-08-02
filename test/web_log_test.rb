require_relative "../test_helper"
require "minitest/autorun"

require_relative "../src/web_log"

class WebLogTest < Minitest::Test
  def setup
    web_log_row_1_url = '/test_page1/1'
    web_log_row_1_ip_address = '111.111.111.111'
    web_log_row_2_url = '/test_page2/2'
    web_log_row_2_ip_address = '222.222.222.222'
    web_log_row_3_url = '/test_page2/2'
    web_log_row_3_ip_address = '333.333.333.333'
    web_log_row_4_url = '/test_page2/2'
    web_log_row_4_ip_address = '333.333.333.333'
    @web_log = WebLog.new
    @web_log_1 = WebLog.new(web_log_row_1_url, web_log_row_1_ip_address)
    @web_log_2 = WebLog.new(web_log_row_2_url, web_log_row_2_ip_address)
    @web_log_3 = WebLog.new(web_log_row_3_url, web_log_row_3_ip_address)
    @web_log_4 = WebLog.new(web_log_row_4_url, web_log_row_4_ip_address)
    @web_log_object_array = []
    @web_log_object_array << @web_log_1
    @web_log_object_array << @web_log_2
    @web_log_object_array << @web_log_3
    @web_log_object_array << @web_log_4
  end

  def test_constructor_happy_path
    refute @web_log.nil?
  end

  def test_adding_web_server_log_url_to_instance
    url = '/test/2'
    @web_log.url = url
    assert_equal '/test/2', @web_log.url
  end

  def test_adding_web_server_ip_address_to_instance
    ip_address = '123.456.789.012'
    @web_log.ip_address = ip_address
    assert_equal '123.456.789.012', @web_log.ip_address
  end

  def test_most_page_views
    result = Hash.new
    result = { "/test_page2/2" => 3, "/test_page1/1" => 1 }
    assert_equal result, WebLog.new.most_page_views(@web_log_object_array)
  end

  def test_uniq_page_views
    result = []
    result << ["/test_page2/2", 2]
    result << ["/test_page1/1", 1]
    assert_equal result, WebLog.new.unique_page_views(@web_log_object_array)
  end
end
