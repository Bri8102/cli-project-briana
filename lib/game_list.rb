module UltraGamer
    class Game_deals
        attr_accessor :name ,  :url #, :price, :console, :type,

        def self.list_games(deal_name)
          # binding.pry
          case deal_name
            when "Essential Picks Sale"
             self.essential_picks(deal_name)
            when "PlayStation®VR Sale"
             self.ps_vr(deal_name)
            when "Deal of the Week"
             self.deal_of_week(deal_name)
            when "Games Under $15"
             self.under_fifteen(deal_name)
            when "All Deals"
             self.all_deals(deal_name)
         end
        end
        
        def self.essential_picks(deal_name)
          essential_list = []

          doc = Nokogiri::HTML(open('https://store.playstation.com/en-us/grid/STORE-MSF77008-ESSENTIALPICKS/1?smcid=pdc%3Aen-us%3Aprimary%2520nav%3Amsg-games%3Abuy-games'))
          
          picks = doc.search('div.grid-cell__body')
          picks.each_with_index{|game, index|
            if index < 30 then
              essential_deal = UltraGamer::Game_deals.new             #create instance of new game
              essential_deal.name = game.css('div.grid-cell__title').css('span').text   
              # essential_deal.price = game.css('h3.price-display__price').text
              # essential_deal.console = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-1').text
              # essential_deal.type = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-2').text
              essential_deal.url =  game.css('div.grid-cell__bottom').css('a').attr('href').value
              essential_list[index] = essential_deal
            end}
         essential_list.sort_by! {|g| [g.name, g.url]}
         essential_list
        end

        def self.ps_vr(deal_name)
          psvr_list = []

          doc = Nokogiri::HTML(open('https://store.playstation.com/en-us/grid/STORE-MSF77008-PSVRSALE/1?smcid=pdc%3Aen-us%3Aprimary%2520nav%3Amsg-games%3Abuy-games'))
          picks = doc.search('div.grid-cell__body')
          picks.each_with_index{|game, index|
            if index < 30 then
              psvr_deal = UltraGamer::Game_deals.new             #create instance of new game
              psvr_deal.name = game.css('div.grid-cell__title').css('span').text   
              # psvr_deal.price = game.css('h3.price-display__price').text
              # psvr_deal.console = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-1').text
              # psvr_deal.type = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-2').text
              psvr_deal.url =  game.css('div.grid-cell__bottom').css('a').attr('href').value
              psvr_list[index] = psvr_deal
            end}
         psvr_list.sort_by! {|g| [g.name, g.url]}
         psvr_list
        end

        def self.deal_of_week(deal_name)
            dow_list = []

            doc = Nokogiri::HTML(open('https://store.playstation.com/en-us/grid/STORE-MSF77008-DEALOFTHEWEEK/1?smcid=pdc%3Aen-us%3Aprimary%2520nav%3Amsg-games%3Abuy-games'))
            
            picks = doc.search('div.grid-cell__body')
            picks.each_with_index{|game, index|
              if index < 30 then
                dow_deal = UltraGamer::Game_deals.new             #create instance of new game
                dow_deal.name = game.css('div.grid-cell__title').css('span').text   
                # dow_deal.price = game.css('h3.price-display__price').text
                # dow_deal.console = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-1').text
                # dow_deal.type = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-2').text
                dow_deal.url =  game.css('div.grid-cell__bottom').css('a').attr('href').value
                dow_list[index] = dow_deal
              end}
           dow_list.sort_by! {|g| [g.name, g.url]}
           dow_list
        end

        def self.under_fifteen(deal_name)
            under_list = []

            doc = Nokogiri::HTML(open('https://store.playstation.com/en-us/grid/STORE-MSF77008-EVERGAMESUNDER15/1?smcid=pdc%3Aen-us%3Aprimary%2520nav%3Amsg-games%3Abuy-games'))
            
            picks = doc.search('div.grid-cell__body')
            picks.each_with_index{|game, index|
              if index < 30 then
                under15_deal = UltraGamer::Game_deals.new             #create instance of new game
                under15_deal.name = game.css('div.grid-cell__title').css('span').text   
                # under15_deal.price = game.css('h3.price-display__price').text
                # under15_deal.console = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-1').text
                # under15_deal.type = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-2').text
                under15_deal.url =  game.css('div.grid-cell__bottom').css('a').attr('href').value
                under_list[index] = under15_deal
              end}
           under_list.sort_by! {|g| [g.name, g.url]}
           under_list
        end

        def self.all_deals(deal_name)
          all_list = []

          doc = Nokogiri::HTML(open('https://store.playstation.com/en-us/grid/STORE-MSF77008-ALLDEALS/1?smcid=pdc%3Aen-us%3Aprimary%2520nav%3Amsg-games%3Abuy-games'))
          
          picks = doc.search('div.grid-cell__body')
          picks.each_with_index{|game, index|
            if index < 30 then
              all_deal = UltraGamer::Game_deals.new             #create instance of new game
              all_deal.name = game.css('div.grid-cell__title').css('span').text   
              # all_deal.price = game.css('h3.price-display__price').text
              # all_deal.console = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-1').text
              # all_deal.type = game.css('div.grid-cell__left-detail.grid-cell__left-detail--detail-2').text
              all_deal.url =  game.css('div.grid-cell__bottom').css('a').attr('href').value
              all_list[index] = all_deal
            end}
         all_list.sort_by! {|g| [g.name, g.url]}
         all_list
        end



     end

end

# UltraGamer::Game_deals.essential_picks("Far Cry")
# UltraGamer::Game_deals.ps_vr()
# UltraGamer::Game_deals.deal_of_week()
# UltraGamer::Game_deals.under_fifteen()
# UltraGamer::Game_deals.all_deals()