module UltraGamer
    class Categories
       attr_accessor :name, :url
  
  
      @@all = []
  
      def initialize(name, url)
        @name = name
        @url = url
        @@all << self
      end
  
      def self.all
        @@all
      end
  
    end
  
  end