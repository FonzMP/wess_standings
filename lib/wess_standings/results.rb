class WessStandings::Results

	@@all = []

	def call
		greeting
		generate_list
		full_rotation
	end

	def greeting
		puts "Below are the current season races that have been completed."
		puts "Please select a race from below to see the results."
	end

	def generate_list
		self.races
	end

	def results_list
		@race_list = WessStandings::Results.all
		@race_list
	end

	def full_rotation
		display_list
		user_input
		selection
	end

	def display_list
		puts " "
		results_list.each_with_index do |item, i|
			puts "#{i + 1}. " + item.name
		end
	end

	def user_input
		puts "\nType 'list' to see the list of races,"
		puts "type 'results' to view results, or"
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
		elsif @user_input == "results"
			WessStandings::Results.new.call
		else
			puts "That's not a valid choice!"
			user_input
			selection
		end
	end

	def races
		doc = Nokogiri::HTML(open("https://iridewess.com/"))
		doc.css('.menu-item-1037').css('a').each_with_index do |f, i|
			race = WessStandings::Race.new
			race.name = f.text.strip
			race.results = f['href']
			@@all << race
			# puts "#{i + 1}. " + f.text.strip
		end
	end

	def self.race_results(profile_url)
		doc = Nokogiri::HTML(open(profile_url))
		doc.css('.event-results-table').css('td').each do |list|
			puts list.text.strip
		end
	end

	def self.all
		@@all
	end

end