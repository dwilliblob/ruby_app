require_relative "../test_helper"
require "minitest/autorun"

require_relative "../src/web_log"

class WebLogTest < Minitest::Test
  def setup
    @web_log = WebLog.new
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

  # def test_reading_file
  #   row = '/help_page/1 126.318.035.038'
  #   first_row = @web_log.parse_webserver_log.first
  #   assert_equal '/help_page/1 126.318.035.038', first_row
  # end

  # def test_score_lower_boundary
  #   assert_equal 10, @rating.score(1)
  # end
  #
  # def test_score_upper_boundary
  #   assert_equal 100, @rating.score(5)
  # end
  #
  # def test_hash_if_empty
  #   a = {}
  #   assert_equal a, HotelRating.new.scores
  # end
  #
  # def test_hash_not_empty
  #   a = {1 => 10, 2 => 40, 3 => 25, 4 => 50, 5 => 100}
  #   assert_equal a, @rating.scores
  # end
  #
  # def test_score_string
  #   assert_equal "* * * ", HotelRating.new.score_string(3)
  # end
  #
  # def test_score_output
  #   assert_equal "25  * * * ", @rating.print_score(3)
  # end
  #
  # def test_score_lower_boundary
  #   refute_equal "25  * * ", @rating.print_score(3)
  # end
  #
  # def test_score_upper_boundary
  #   refute_equal "25  * * * * ", @rating.print_score(3)
  # end
  #
  # def test_average
  #   assert_equal 45, @rating.average
  # end
  #
  # def test_can_change_score
  #   @rating.update_score(3, 50)
  #   assert_equal 50, @rating.score(3)
  # end
  #
  # def test_ordering
  #   a = {3 => 25, 1 => 10, 4 => 50, 2 => 40, 5 => 100}
  #   assert_equal [5, 4, 3, 2, 1], HotelRating.new(a).order
  # end
  #
  # def test_largest_value
  #   assert_equal 3, @rating.largest_value
  # end
  #
  # def test_complete_output
  #   str = "100 * * * * * \n50  * * * * \n25  * * * \n40  * * \n10  * \nAverage: 45"
  #   assert_equal str, @rating.to_s
  # end
end
