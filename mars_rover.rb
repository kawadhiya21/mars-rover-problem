require './mars_rover_class.rb'

max_coords_input = gets.chomp
max_coords = max_coords_input.split(" ")

rover = MarsRover.new(max_coords[0].to_i, max_coords[1].to_i)

while true
  current_coords_input = gets.chomp
  break if current_coords_input == ""
  current_coords = current_coords_input.split(" ")
  rover.current_pos(current_coords[0].to_i, current_coords[1].to_i, current_coords[2])
  
  commands = gets.chomp
  rover.operate(commands)
  
  puts rover.position[:cur_x].to_s + " " + rover.position[:cur_y].to_s + " " + rover.position[:cur_d].to_s
end