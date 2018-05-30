class WessStandings::CLI

	include Memorable::InstanceMethods

	def call
		greeting
		WessStandings::Schedule.races
		WessStandings::Results.new.generate_list
		full_rotation
	end

	def recall
		greeting
		full_rotation
	end

	def race_list
		@race_list = WessStandings::Schedule.all
		@race_list
	end

	def display_list
		puts " "
		race_list.each_with_index do |item, i|
			puts "#{i + 1}. " + item.name + " - " + item.location + " - " + item.date
		end
	end

	def selection
		if @user_input.to_i <= @race_list.length && @user_input.to_i > 0
			race = @race_list[@user_input.to_i - 1]
			WessStandings::Schedule.about("#{race.url}")
			full_rotation
		elsif @user_input == "exit"
			puts "Thanks for hanging with us!"
			exit
		elsif @user_input == "schedule"
			full_rotation
		elsif @user_input == "results"
			WessStandings::Results.new.call
		else
			puts "That's not a valid choice!"
			user_input
			selection
		end
	end
	
end