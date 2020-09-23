module UltraGamer
    class CLI  

        def start 
            welcome
            UltraGamer::Scraper.scrape_categories
            puts "\nPlease enter a number associated with the deal you would like to view."
            list_categories  
            category_input      
        end
        
        def welcome
            puts "_________________________________________________________".blue
            puts " "
            puts "--------------Hello! Welcome to GAMER GRID---------------".blue.bold
            puts "------- Explore Game Deals by selecting from 1-5 --------".blue
            puts "_________________________________________________________".blue
        end

        def category_input
            print "\nPick a number to see all the games: "
            input = gets.chomp.to_i
            game = UltraGamer::Categories.all[input-1]
            case input
            when 1..UltraGamer::Categories.all.length
                puts "\nNow, which game would you like to see?"
                UltraGamer::Games.reset
                list_games(game)
                # game_input 
                puts "--------------------"
                options
                puts "--------------------"
            else
                puts "Ooops, What was that?"
                category_input
            end
        end

        def list_categories
            UltraGamer::Categories.all.each.with_index(1).each do |deal, i|
                puts "#{i}. #{deal.name}".blue
            end
        end

        def list_games(games)
            UltraGamer::Scraper.scrape_games(games)
            UltraGamer::Games.all.each.with_index(1).each do |game, i|
                puts "#{i}. #{game.game_name} | #{game.price} | #{game.console} | #{game.type} ".blue
           end
        end

        def options
           puts "\nWant to view a different category? Type \"C\"".blue
           puts "Want to exit the program? Type \"E\"".blue
           print "Type here: "
           input = gets.chomp.downcase
           case input
           when "c"
               puts "\nWhich month would you like to see instead?"
               list_categories
               category_input
           when "e"
               goodbye
               exit
           else
               puts "\nThere must have been a typo, try again!"
               options
           end
        end


        def goodbye
            puts "\nSee ya later Gamer! Come again soon".red.on_white.bold
            exit
        end
    
        
    end
end

