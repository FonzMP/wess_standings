# WESS Standings for current Season

- Will scrape https://iridewess.com/events/ to get race list, and then list details, or results from each race.

- Challenges / additional thoughts
	- How to make this fail proof for future?
	- Would it be a simple URL change for scrape in future?


- Mock Build Up

	First Window - Schedule View

		"Welcome to WESS Standings results for #{year}."
		"Your season schedule, race description and results page for the 2018 season."
		

			"1. Race 1"
			"2. Race 2"
			"3. Race 3"
			"4. Race 4"
			etc

		"To view more information, select a race number from above:"


	Second Window (Results). #Show top ten or full? - Give option?

		"The #{race.name} was ran on #{race.date}."
		"The #{race.results} are shown below"
			1. Rider 1 - Manufacturer - Points
			2. Rider 2 - Manufacturer - Points
			3. Rider 3 - Manufacturer - Points
			4. Rider 4 - Manufacturer - Points
			5. Rider 5 - Manufacturer - Points
			6. Rider 6 - Manufacturer - Points


	Second Window (Race Details)
		"Scrape from Race Details Page - First Paragraph only"

		----- revert back to list? ------
