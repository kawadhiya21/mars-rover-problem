require "./mars_rover_class.rb"
require "test/unit"

class TestMarsRover < Test::Unit::TestCase
  def test_rover
    rover = MarsRover.new(5, 5)
    rover.set_current_pos(1, 2, "N")
    rover.follow_commands("LMLMLMLMM")
    assert_equal rover.position[:cur_x], 1
    assert_equal rover.position[:cur_y], 3
    assert_equal rover.position[:cur_d].to_s, "N"

    rover.set_current_pos(3, 3, "E")
    rover.follow_commands("MMRMMRMRRM")
    assert_equal rover.position[:cur_x], 5
    assert_equal rover.position[:cur_y], 1
    assert_equal rover.position[:cur_d].to_s, "E"
  end
end