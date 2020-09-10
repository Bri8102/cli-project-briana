require 'nokogiri'
require 'open-uri'

#self.list_destination_names(theme_name)
RETURN the result from scraping, listing 5 dishes & Drink Options

#self.scrape_destinations(theme_name)
- Access selected THEME webpage through open-uri
- Parse webpage to XML using Nokogiri
- Select the TOP DESTINATIONS section
- Loop through destinations, creating a new instance per destination assigning name, continent and destination URL
- Push each theme into an array: list
- Return list array