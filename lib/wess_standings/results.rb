class WessStandings::Results

	@@all = []

	def call
		greeting
		races
	end

	def greeting
		puts "Below are the current season races that have been completed."
		puts "Please select a race from below to see the results."
	end

	def user_input
		puts "\nType 'list' to see the list of races,"
		puts "type 'results' to view results, or"
		puts "type 'exit' to leave the program"
		puts "\nPlease select a race number from above: "
		@user_input = gets.strip.downcase
	end


	def races
		doc = Nokogiri::HTML(open("https://iridewess.com/"))
		doc.css('.menu-item-1037').css('a').each_with_index do |f, i|
			race = WessStandings::Race.new
			race.name = f.text.strip
			race.results = f['href']
			@@all << race
			binding.pry
			# puts "#{i + 1}. " + f.text.strip
		end
	end

	def self.race_results(profile_url)
		results_doc = Nokogiri::HTML(open(profile_url))
		results_doc.css('.event-results-table').css('td').each do |list|
			puts list.text.strip
		end
	end

	def self.all
		@@all
	end

end