class WessStandings::CLI

	def call
		greeting
		generate_list
		full_rotation
	end

	def greeting
		puts "Welcome to WESS Standings results for 2018."
		puts "This program will provide a season schedule, \nand provide a brief description of each race."
	end

	def generate_list
		WessStandings::Schedule.races
	end

	def race_list
		@race_list = WessStandings::Schedule.all
		@race_list
	end

	def full_rotation
		display_list
		user_input
		selection
	end

	def display_list
		puts " "
		race_list.each_with_index do |item, i|
			puts "#{i + 1}. " + item.name + " - " + item.location + " - " + item.date
		end
	end

	def user_input
		puts "\nType 'list' to see the list of races, or"
		puts "type 'exit' to leave the program"
		puts "\nPlease select a race number from above: "
		@user_input = gets.strip.downcase
	end

	def selection
		if @user_input.to_i <= @race_list.length && @user_input.to_i > 0
			race = @race_list[@user_input.to_i - 1]
			puts "The #{race.name} is set to be held in #{race.location} on #{race.date}."
			WessStandings::Schedule.about("#{race.url}")
			full_rotation
		elsif @user_input == "exit"
			puts "Thanks for hanging with us!"
			exit
		elsif @user_input == "list"
			full_rotation
		else
			puts "That's not a valid choice!"
			user_input
			selection
		end
	end
	
end