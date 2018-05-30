class WessStandings::Results

	include Memorable::InstanceMethods


	@@all = []

	def call
		greeting
		full_rotation
	end

	def generate_list
		self.races
	end

	def results_list
		@race_list = WessStandings::Results.all
		@race_list
	end

	def full_rotation_after_load
		display_list
		user_input_after_results_load
		selection
	end

	def user_input_after_results_load
		puts "\nType 'schedule' to see the schedule for 2018,"
		puts "type 'results' to go in to the results mode, or"
		puts "type 'full' to see the full results list,"
		puts "type 'short' to see the short results list (default), "
		puts "type 'exit' to leave the program"
		@user_input = gets.strip.downcase
	end

	def display_list
		puts " "
		results_list.each_with_index do |item, i|
			puts "#{i + 1}. " + item.name
		end
	end

	def selection
		if @user_input.to_i <= @race_list.length && @user_input.to_i > 0
			race = @race_list[@user_input.to_i - 1]
			WessStandings::Results.race_results("#{race.results}")
			WessStandings::Results.display_race_results
			full_rotation_after_load
		elsif @user_input == "exit"
			puts "Thanks for hanging with us!"
			exit
		elsif @user_input == "schedule"
			WessStandings::CLI.new.recall
		elsif @user_input == "results"
			WessStandings::Results.new.call
		elsif @user_input == "full"
			WessStandings::Results.display_race_results_all
			full_rotation_after_load
		elsif @user_input == "short"
			WessStandings::Results.display_race_results
			full_rotation_after_load
		else
			puts "That's not a valid choice!"
			full_rotation_after_load
		end
	end

	def races
		doc = Nokogiri::HTML(open("https://iridewess.com/"))
		doc.css('.menu-item-1037').css('a').each_with_index do |f, i|
			race = WessStandings::Race.new
			race.name = f.text.strip
			race.results = f['href']
			@@all << race
		end
	end

	def self.race_results(profile_url)
		@race_results = []
		doc = Nokogiri::HTML(open(profile_url))
		doc.css('.event-results-table').css('tr').each do |row|
			rider = WessStandings::Rider.new
			if row.css('td')[0].text.include?(" ")
				rider.last_name = row.css('td')[0].text.strip.split(" ").map {|name| name.capitalize}.join(" ")
			else
				rider.last_name = row.css('td')[0].text.strip
			end
			rider.first_name = row.css('td')[1].text.strip
			rider.manufacturer = row.css('td')[3].text.strip
			rider.points = row.css('td')[4].text.strip
			@race_results << rider
		end
		@race_results
	end

	def self.display_race_results
		counter = 1
		@race_results.each_with_index do |rider, i|
			if counter <= 50
				puts "#{counter}. " + rider.first_name + " " + rider.last_name + " - " + rider.manufacturer + " - " + rider.points
				counter += 1
			else
				puts "......"
				break
			end
		end
	end

	def self.display_race_results_all
		@race_results.each_with_index do |rider, i|
			puts "#{i + 1}. " + rider.first_name + " " + rider.last_name + " - " + rider.manufacturer + " - " + rider.points
		end
	end

	def self.all
		@@all
	end

end