require 'nokogiri'
require 'open-uri'
# require 'pry'
#this file should scrape the list of COUNTRIES with the best food
# 2 class methods


module ForAFoodie
    class Countries
        attr_accessor :name   
    
        def self.list_country_names
         
            self.scrape_countries
        end

        def self.scrape_countries
            country_list = []
            doc = Nokogiri::HTML(open('https://www.goatsontheroad.com/best-countries-for-food/#Indianbsp'))
            countries =  doc.search('.post-71490').css('h2').css('span').text.split(/(?=[A-Z])/)[0..9] #contains array list of countries 
            countries.each_with_index {|country, index|
              if index < 9 then
                new_country = ForAFoodie::Countries.new
                new_country.name = country.css('h2').text
                country_list[index] = new_country
              end
            }
            country_list
        end
    
    end
end

ForAFoodie::Countries.new.list_country_names

# scrape names of the coutrys with the best food from yonderbound website

#self.list_country_names
# RETURN the result from scraping, listing 20 themes, scrape only 12

# #self.scrape_countries
# - Access yonderbound homepage through open-uri
# - Parse webpage to XML using Nokogiri
# - Select the country names
# - Loop through countries, creating a new instance per country assigning name 
# - Push each country into an array: country_list
# - Return country_list array
#body of article - doc.search('.post-71490')
#names of countries -  doc.search('.post-71490').css('h2').css('span').text.split(/(?=[A-Z])/)[0..9]

