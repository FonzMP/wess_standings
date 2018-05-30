# WESS Standings for current Season

- Will scrape https://iridewess.com/events/ to get race list, and then list details, or results from each race.
	1. Previous races results
		a. Previous Results will be displayed if the race is completed.
	2. Future races name / date / time / location




- Challenges / additional thoughts
	- How to make this fail proof for future?
	- Would it be a simple URL change for scrape in future?


- Mock Build Up

	First Window

		"Welcome to WESS Standings results for #{year}."
		"The current years races are shown below."
		"Please select a race to a. View Details or b. View Results."

			"1. Race 1"
			"2. Race 2"
			"3. Race 3"
			"4. Race 4"
			"5. Race 5"
			"6. Race 6"
			etc


	Second Window (Results). #Show top ten or full? - Give option? Full is 50

		"The #{race.name} was ran on #{race.date}."
		"The #{race.results} are shown below"
			1. Rider 1 - Manufacturer - Points
			2. Rider 2 - Manufacturer - Points
			3. Rider 3 - Manufacturer - Points
			4. Rider 4 - Manufacturer - Points
			5. Rider 5 - Manufacturer - Points
			6. Rider 6 - Manufacturer - Points


	Second Window (Race Details)
		"The #{race.name} is set to be ran on #{race.date}."
		"Please check back for results after that date!"

		----- revert back to list? ------
