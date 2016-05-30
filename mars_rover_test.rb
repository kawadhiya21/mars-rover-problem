require "./mars_rover_class.rb"
require "test/unit"

class TestMarsRover < Test::Unit::TestCase
  def test_initialize
    rover = MarsRover.new(3, 5)

    assert_equal 3, rover.max_x
    assert_equal 5, rover.max_y
  end

  def test_set_current_pos
    rover = MarsRover.new(3, 5)
    rover.set_current_pos(1, 2, "N")

    assert_equal 1, rover.position[:cur_x]
    assert_equal 2, rover.position[:cur_y]
    assert_equal "N", rover.position[:cur_d]
  end

  def test_rotate
    rover = MarsRover.new(3, 5)
    rover.set_current_pos(1, 2, "N")

    rover.rotate("R")
    assert_equal "E", rover.position[:cur_d]

    rover.rotate("L")
    assert_equal "N", rover.position[:cur_d]

    rover.rotate("L")
    assert_equal "W", rover.position[:cur_d]

    rover.rotate("L")
    assert_equal "S", rover.position[:cur_d]
  end

  def test_determine_displacement
    rover = MarsRover.new(3, 5)
    rover.set_current_pos(1, 2, "N")

    displacement = rover.determine_displacement
    assert_equal displacement[:x], 0
    assert_equal displacement[:y], 1

    rover.position[:cur_d] = "E"

    displacement = rover.determine_displacement
    assert_equal displacement[:x], 1
    assert_equal displacement[:y], 0

    rover.position[:cur_d] = "S"

    displacement = rover.determine_displacement
    assert_equal displacement[:x], 0
    assert_equal displacement[:y], -1

    rover.position[:cur_d] = "W"

    displacement = rover.determine_displacement
    assert_equal displacement[:x], -1
    assert_equal displacement[:y], 0
  end

  def test_move
    rover = MarsRover.new(3, 5)
    rover.set_current_pos(1, 2, "N")

    rover.move
    assert_equal 1, rover.position[:cur_x]
    assert_equal 3, rover.position[:cur_y]
    assert_equal "N", rover.position[:cur_d]
  end

  def test_follow_commands
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
