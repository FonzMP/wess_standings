module Memorable

	module InstanceMethods

		def full_rotation
			display_list
			user_input
			selection
		end

		def user_input
			puts "\nType 'schedule' to go in to schedule mode,"
			puts "type 'results' to go in to results mode, or"
			puts "type 'exit' to leave the program"
			puts "\nTo view more information, select a race number from the list,"
			puts "or select a mode from the list above:"
			@user_input = gets.strip.downcase
		end

		def greeting
			puts "Welcome to WESS Standings results for 2018."
			puts "Your season schedule, race description and results page for the 2018 season."
		end

	end

end