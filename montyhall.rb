#Modelling the Monty Hall Problem

#A little user interface

puts "Welcome to the Monty Hall Problem!"
puts "You pick one out of three doors at random."
puts "Behind two doors, there are goats."
puts "Behind 1, $64,000."
puts "You pick one door at random."
puts "One door is opened to reveal a goat."
puts "Do you want to stay with your original random choice\[1\] or pick the unrevealed random door\[2\]?"
puts "Please enter 1 or 2."
puts "We will run this simulation 1000 times."

door_switching_strategy = gets.chomp

sum = 0
switch_choice = 0

1000000.times do
	#Assigning values to the array
	array = [false, false, false]
	array[rand(3)] = true

	#"Picking a door"
	random_choice = rand(3)
	
	#Opening a door with a goat
	open_goat_door_array_index = rand(3)
	while array[open_goat_door_array_index]
		open_goat_door_array_index = rand(3)
	end
	
	#Simplifying later code with spaghetti logic, refactor?	
	if random_choice == 0 && open_goat_door_array_index == 1
		switch_choice = 2
	end

	if random_choice == 0 && open_goat_door_array_index == 2
		switch_choice = 1
	end

	if random_choice == 1 && open_goat_door_array_index == 0
		switch_choice = 2
	end

	if random_choice == 1 && open_goat_door_array_index == 2
		switch_choice = 0
	end

	if random_choice == 2 && open_goat_door_array_index == 0
		switch_choice = 1
	end	

	if random_choice == 2 && open_goat_door_array_index == 1
		switch_choice = 0
	end

	#Taking into account player choice and adding to the accumulator
	if door_switching_strategy == '1'
		#staying with the original door choice
		if array[random_choice]
			sum += 1
		end
	else
		#changing door choice
		if array[switch_choice]
			sum += 1
		end
	end	
end

puts "Won #{sum} times"