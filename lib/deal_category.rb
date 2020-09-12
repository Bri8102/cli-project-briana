# scrape playstation wesbite for deals - 5 categories of deals
# site - 'https://store.playstation.com/en-us/grid/STORE-MSF77008-WEEKLYDEALS/1?smcid=pdc%3Aen-us%3Aprimary%2520nav%3Amsg-games%3Abuy-games'

module UltraGamer
  class Deal_Categories
        attr_accessor :name, :url

        def self.list_deal_category
          self.scrape_deal_category
        end

        def self.scrape_deal_category
           deal_categ_list = []

           doc = Nokogiri::HTML(open('https://store.playstation.com/en-us/grid/STORE-MSF77008-WEEKLYDEALS/1?smcid=pdc%3Aen-us%3Aprimary%2520nav%3Amsg-games%3Abuy-games'))

           deals = doc.search('div.grid-cell__body')
           deals.each_with_index{|deal, index|
             if index < 5 then
                new_deal = UltraGamer::Deal_Categories.new #create deal instance
                new_deal.name = deal.css('div.grid-cell__title.grid-cell__title--full').css('span').text    #assign deal name
                new_deal.url = deal.css('div.grid-cell__bottom').css('a').attr('href').value     #assign deal url for destination #scraping
                deal_categ_list[index] = new_deal
             end }
           deal_categ_list
        end

    end
end