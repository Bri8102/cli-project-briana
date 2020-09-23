module UltraGamer
    class Games
        attr_accessor :game_name, :price, :console, :type

        @@all = []

        def initialize(game_name, price, console, type)
            @game_name = game_name
            @price = price
            @console = console
            @type = type
            @@all << self
        end

        def self.all
            @@all
        end

        def self.reset
            self.all.clear
        end

    end
end