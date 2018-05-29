class WessStandings::Schedule

	@@all = []

	def self.races
		doc = Nokogiri::HTML(open("https://iridewess.com/events/"))
		# pulling container from website
		counter = 0
		doc.css('.wf-cell').each_with_index do |item, i|
			# only completing list item if h4 (or race.name) is valid
			if item.css('h4').text != ""
				# creates new race for each item in above and assigns name, date, location, url, etc;
				race = WessStandings::Race.new
				race.name = item.css('h4').text
				race.location = item.css('.wess-event-country').text.strip
				race.date = item.css('.wess-event-date').text.strip
				# binding.pry
				race.url = item.css('a.button')[0]['href']
				@@all << race
				counter += 1
			end
		end
	end

	def self.all
		@@all
	end

end