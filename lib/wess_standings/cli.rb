class WessStandings::CLI

	def call
		greeting
		race_list
		selection
	end

	def greeting
		puts "Welcome to WESS Standings results for 2018."
		puts "This program will display details of future races, \nand results of previous races."
		puts "Please select a 2018 race below."
	end

	def race_list
		@races = WessStandings::Schedule.races
	end

	def user_input
		puts "\nPlease select a race number from above: "
		puts "Or type 'exit' to leave the program"
		@user_input = gets.strip.downcase
	end

	def selection
		if @user_input == "1"
			puts "You've selected 1"
		elsif @user_input == "exit"
			puts "Thanks for hanging with us!"
			exit
		else
			puts "That's not a valid choice!"
			user_input
			selection
		end
	end
	
end