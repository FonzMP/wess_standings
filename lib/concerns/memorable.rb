module Memorable

	module ClassMethods

	end

	module InstanceMethods

		def full_rotation
			display_list
			user_input
			selection
		end

		def user_input
			puts "\nType 'list' to see the race schedule for 2018,"
			puts "type 'results' to go in to the results mode, or"
			puts "type 'exit' to leave the program"
			puts "\nPlease select a race number from above: "
			@user_input = gets.strip.downcase
		end

	end

end