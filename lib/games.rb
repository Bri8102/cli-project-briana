require 'nokogiri'
require 'open-uri'
require 'pry'

#this file should scrape the list of COUNTRIES with the best food
# 2 class methods


module GamerGrid
    class Games
        attr_accessor :name, :description, :release_date, :developer, :publisher
    
        def self.game_info
            self.scrape_games
        end

        def self.scrape_games
            games = []

            games << self.scrape_playstation

            games
        end

        def self.scrape_playstation
            doc = Nokogiri::HTML(open('https://www.playstation.com/en-us/games/tony-hawks-pro-skater-1-2-ps4/'))
      

            game = self.new
            game.name = doc.css('div.lead-product-info__info__wrapper').css('h1').text #"Tony Hawk's™ Pro Skater™ 1 + 2" 
            game.description = doc.css('div.lead-product-info__info__wrapper').css('p').text
            game.release_date = doc.css('small.platform').first.text.split(/(?=[A-Z])/)[3..4].join
            game.developer = doc.css('small.platform.hide-sm').first.text.split(/(?=[A-Z])/)[2..3].join
            game.publisher = doc.css('small.platform').last.text.split(/(?=[A-Z])/)[2]

            game
        end


        def self.url_for_game_info(game_name)
            "https://www.playstation.com/en-us/explore/games/ps4-games/?console=ps4#{game_name.downcase.gsub!(/[\s,]+/,"-")}/"
        end

    end
end


# #"Tony Hawk's™ Pro Skater™ 1 + 2" 
# # "Drop back in with the most iconic skateboarding games ever made. Play the fully-remastered Tony Hawk’s™ Pro Skater™ & 
# # Tony Hawk’s™ Pro Skater™ 2 games in one epic collection, rebuilt from the ground up in incredible HD." 
