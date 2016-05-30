require "./mars_rover_class.rb"
require "test/unit"

class TestMarsRover < Test::Unit::TestCase
  def test_rover
    rover = MarsRover.new(5, 5)
    rover.current_pos(1, 2, "N")
    rover.operate("LMLMLMLMM")
    assert_equal rover.position[:cur_x], 1
    assert_equal rover.position[:cur_y], 3
    assert_equal rover.position[:cur_d].to_s, "N"

    rover.current_pos(3, 3, "E")
    rover.operate("MMRMMRMRRM")
    assert_equal rover.position[:cur_x], 5
    assert_equal rover.position[:cur_y], 1
    assert_equal rover.position[:cur_d].to_s, "E"
  end
end