# require_relative 'deal_category.rb'
# require_relative 'scraper.rb'


module GamerGrid
  class CLI  
      
      def start 
          list_deals
      end
      
      def list_deals
          puts "Hello! Welcome to GAMER GRID".blue.bold
          puts "Which Game Deal would you like to explore? \nPlease select a deal from 1-5".blue
          deal_arr = UltraGamer::Deal_Categories.list_deal_category
          puts deal_arr.map.with_index {|deal,index| 
            "\t#{index+1}. #{deal.name}"}
          puts "--------------------------------------------".black.on_white
          select_deal(deal_arr)
      end

      def select_deal(deal_arr)
          input = nil

          while true
              input = Readline.readline("Select Deal:", true).strip

              goodbye if input.downcase === "exit"
              input = input.to_i

             
              if input > 0 && input < 6
                  puts "--------------------------------------------".black.on_white
                  deal_name = deal_arr[input-1].name.strip
                  puts "Here are the games on sale for #{deal_name.upcase}\n".blue.bold
                  list_games(deal_name)
              else
                  puts "That selection is not valid. Please select a Game Deal from 1 - 5, or type exit."
              end
          end

      end

      def list_games(deal_name)
          # binding.pry
          puts "Please select a game from 1 - 30".blue.bold
          game_arr = UltraGamer::Game_deals.list_games(deal_name)

          puts game_arr.map.with_index {|g, index|
          "\t#{index+1}. #{g.name}"}
          # puts "--------------------------------------------".black.on_white
          # select_game(game_arr)
      end

      # def select_game(game_arr)
      #     user_input = nil

      #     while true
      #         user_input = Readline.readline("Select Game:", true).strip

      #         goodbye if user_input.downcase === "exit"

      #         game_choice = user_input.to_i

             
      #         if game_choice > 0 && game_choice < 31
      #             # binding.pry
      #             puts "--------------------------------------------".black.on_white
      #             game_choice = game_arr[game_choice-1].name.upcase
      #             puts "Here is the deal info for #{game_choice}".blue.bold
      #             game_info(game_choice)
      #         else
      #             puts "That selection is not valid. Please select a Game from 1 - 30, or type exit."
      #         end
      #     end
      # end 

      # def game_info(game_choice)
      #    game = UltraGamer::Game_Info.new(game_choice)
      #    puts info.game_deets
      # end
         
     
      def goodbye
          puts "\nSee ya later Gamer! Come again soon".red.on_white.bold
          exit
      end

  end
      

end

puts GamerGrid::CLI.new.start 