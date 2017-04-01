restaurants = {
    Bongilcheonsundaesoup: ["korea","sundaesoup",2]
}
puts "What would you like to do?"
puts "-- Type 'add' to add a movie."
puts "-- Type 'update' to update a movie"
puts "-- Type 'display' to display all movies."
puts "-- Type 'delete' to delete a movie."
choice = gets.chomp
while choice!="exit"
    case choice
        when "add"
            puts "What is your restaurant name?"
            restaurant = gets.chomp
            if restaurants[restaurant.to_sym].nil?
                puts "What's the category?(Type a string korea/chinese/japanese/western.)"
                category=gets.chomp
                if category != "korea" && category != "chinese" && category != "japanese" && category != "western"
                    puts "That's the wrong word. Please write again"
                    puts "What's the category?(Type a string korea/chinese/japanese/western.)"
                    category=gets.chomp
                end
                puts "What's the best menu?"
                menu=gets.chomp
                puts "What's the rating? (Type a number 0 to 5.)"
                rating=gets.chomp.to_i
                if rating != 1 && rating != 2 && rating != 3 && rating != 4 && rating != 5
                    puts "That's the wrong word. Please write again"
                    puts "What's the rating? (Type a number 0 to 5.)"
                rating=gets.chomp.to_i
                end
                restaurants[restaurant.to_sym]=[category,menu,rating]
                puts "#{restaurant} has been added."
            else
                puts "That restaurant already exists!"
            end
        when "update"
            puts "What restaurant do you want to update?"
            restaurant= gets.chomp
            if restaurants[restaurant.to_sym].nil?
                puts "restaurant not found!"
            else
                puts "What's the new rating? (Type a number 0 to 5)"
                rating = gets.chomp
                restaurants[restaurant.to_sym] = category,menu,rating.to_i
                puts "#{restaurant} has been updated."
            end
        when "display"
            puts restaurants
            arr=restaurants.sort_by{|k,v| v[2]}.reverse
            arr.each do |k, v|
                puts "#{k}: #{v}"
            end

        when "delete"
            puts "What restaurant do you want to delete?"
            restaurant = gets.chomp
            if restaurants[restaurant.to_sym].nil?
                puts "restaurant not found!"
            else
                restaurants.delete(restaurant.to_sym)
                puts "#{restaurant} has been removed."
            end
        when "exit"
        else
            puts "That's the wrong word."
    end
    puts "What would you like to do?"
    choice = gets.chomp
end
if choice=="exit"
    puts "The end"
end





