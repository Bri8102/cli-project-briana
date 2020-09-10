class  CLI

end


#Welcomes User
#Asks if wants to travel for food - y or no
#Pick number 1-15 from country list
#See list of Dish
#Pick number from 1- 5 to see Dish Detail
#Sees Dish Detail
#Ask if would liike to see best drinks
# Shows Drink
# Asks to see another country
# yes - brings list again
# no - Seee ya, Come again next time foodie


Country.all.each.with_index(1) {|country, index| puts "#{index}. #{country}"}