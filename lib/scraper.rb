module UltraGamer
    class Scraper
      
      DEAL_URL = "https://store.playstation.com/en-us/grid/STORE-MSF77008-WEEKLYDEALS/1?smcid=pdc%3Aen-us%3Aprimary%2520nav%3Amsg-games%3Abuy-games"
      RELATIVE_URL = "https://store.playstation.com/"
   

      def self.scrape_categories
          @doc = Nokogiri::HTML(open(DEAL_URL))
          @scrape_block = @doc.css('div.grid-cell__body')

          @scrape_block.each do |deal|
            name =  deal.css('div.grid-cell__title.grid-cell__title--full').css('span').text
            url = deal.css('div.grid-cell__bottom').css('a').attr('href').value  
            new_deal = UltraGamer::Categories.new(name,url)
          end 
      end

      def self.scrape_games(game)
          @game_doc = Nokogiri::HTML(open(RELATIVE_URL+game.url))
          @scrape_games = @game_doc.css('div.grid-cell__body')
         
          @scrape_games.each do |game|
               game_name = game.css('div.grid-cell__title').css('span').text   
               price = game.css('h3.price-display__price').text
               console = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-1').text
               type = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-2').text
               new_game = UltraGamer::Games.new(game_name, price, console, type)
          end 
      end


    end
end