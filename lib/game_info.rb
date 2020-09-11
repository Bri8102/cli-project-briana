# require 'nokogiri'
# require 'open-uri'
# require_relative 'deal_category.rb'
# require_relative 'game_list.rb'

module UltraGamer
    class Game_Info
        attr_accessor :name, :price, :console, :type, :url 

        def initialize(name)
            @name = name
        end
        
        def game_deets(name)
            # binding.pry
            scrape_game_info(name)

            puts "Price: \t#{@price}"
            puts "Console: #{@console}"
            puts "Type: #{@type}\n"
        end

        def scrape_game_info(name)
            doc = Nokogiri::HTML(open(url))

            info_url = doc.search('div.grid-cell__bottom').css('a').attr('href').value
            info_page = Nokogiri::HTML(open(info_url))
            
            price.price = info_page.search('h3.price-display__price').text
            console.console = info_page.search('div.grid-cell__left-detail.grid-cell__left-detail--detail-1').text
            type.type = info_page.search('div.grid-cell__left-detail.grid-cell__left-detail--detail-2').text

        end

        def url
            downcased = @name.downcase
            dasherized = downcased.gsub(/[\s,]+/,"-")
            "https://store.playstation.com/en-us/grid/STORE-MSF77008-WEEKLYDEALS/1?smcid=pdc%3Aen-us%3Aprimary%2520nav%3Amsg-games%3Abuy-games" + dasherized
        end
        

        
    end
end

# UltraGamer::Game_info.game_deets
