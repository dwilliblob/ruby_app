require_relative "../test_helper"
require "minitest/autorun"

require_relative "../src/loader"

class LoaderTest < Minitest::Test
  def setup
    @loader = Loader.new
  end

  def test_constructor_happy_path
    refute @loader.nil?
  end

  def test_parsing_webserver_log_file
    filename = 'webserver.log'
    array_objects = @loader.parse_file(filename)
    assert_equal '/help_page/1', array_objects.first.url
    assert_equal '126.318.035.038', array_objects.first.ip_address
  end
end
