class WessStandings::Schedule

	@@all = []

	def self.races
		doc = Nokogiri::HTML(open("https://iridewess.com/events/"))
		# pulling container from website
		doc.css('.wf-cell').each_with_index do |item, i|
			# only completing list item if h4 (or race.name) is valid
			if item.css('h4').text != ""
				# creates new race for each item in above and assigns name, date, location, etc;
				race = WessStandings::Race.new
				race.name = item.css('h4').text
				race.location = item.css('.wess-event-country').text.strip
				race.date = item.css('.wess-event-date').text.strip
				race.url = item.css('a.button')[0]['href']
				@@all << race
			end
		end
	end

	def self.all
		@@all
	end

end