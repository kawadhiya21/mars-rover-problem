require './mars_rover_class.rb'

max_coords_input = gets.chomp
max_coords = max_coords_input.split(" ")

rover = MarsRover.new(max_coords[0].to_i, max_coords[1].to_i)

while true
  current_coords_input = gets.chomp
  break if current_coords_input == ""
  current_coords = current_coords_input.split(" ")
  cur_x = current_coords[0].to_i
  cur_y = current_coords[1].to_i
  cur_d = current_coords[2]
  rover.set_current_pos(cur_x, cur_y, cur_d)
  
  commands = gets.chomp
  rover.follow_commands(commands)
  
  pos_x = rover.position[:cur_x].to_s
  pos_y = rover.position[:cur_y].to_s
  direction = rover.position[:cur_d]
  puts pos_x + " " + pos_y + " " + direction
end