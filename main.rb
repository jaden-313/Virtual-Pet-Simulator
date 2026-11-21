
require_relative "pet"

puts "===================================="
puts " Welcome to Ruby Pet Adoption Center!"
puts "===================================="

# The outer loop lets you adopt again if your pet runs away.
loop do
  choice = ""

  until ["1", "2", "3", "4"].include?(choice)
    puts "\nChoose your pet:"
    puts "1. Cat"
    puts "2. Dog"
    puts "3. Rabbit"
    puts "4. Horse"

    choice = gets&.strip
    exit if choice.nil?

    unless ["1", "2", "3", "4"].include?(choice)
      puts "Invalid choice. Please select 1, 2, 3, or 4."
    end
  end

  name = ""

  while name.empty?
    puts "\nWhat would you like to name your pet?"
    name = gets&.strip
    exit if name.nil?

    if name.empty?
      puts "Please enter a valid name for your pet."
    end
  end

  name = name.capitalize

  pet = case choice
        when "1" then Cat.new(name)
        when "2" then Dog.new(name)
        when "3" then Rabbit.new(name)
        when "4" then Horse.new(name)
        end

  puts "\nCongratulations! You've adopted a #{pet.species} named #{pet.name}."
  puts "You received $100 to start taking care of your pet!"

  pet.make_sound
  pet.display_stats

  # Main Menu
  loop do
    puts "\n===================================="
    puts "             PET MENU"
    puts "===================================="
    puts "1. Feed your pet"
    puts "2. Play with your pet"
    puts "3. Let your pet sleep"
    puts "4. Check pet statistics"
    puts "5. Visit the pet shop"
    puts "6. Check your balance"
    puts "7. Exit"

    puts "\nChoose an option:"

    option = gets&.strip
    exit if option.nil?

    case option

    when "1"
      if pet.feed
        pet.finish_round(fed: true)
      end

    when "2"
      pet.play
      pet.finish_round

    when "3"
      pet.sleep
      pet.finish_round

    when "4"
      pet.display_stats

    when "5"
      # Pet Shop
      loop do
        pet.update_needs

        puts "\n===================================="
        puts "              PET SHOP"
        puts "===================================="
        puts "Your balance: $#{pet.money}"
        puts "1. Premium Food - $15 (Hunger -30)"
        puts "2. Toy - $20 (Happiness +25)"
        puts "3. Energy Snack - $15 (Energy +20)"
        puts "4. Medicine - $30 (Health +25)"
        puts "5. Treat - $5 (Happiness +10)"
        puts "6. Return to main menu"

        puts "\nWhat would you like to buy?"

        shop_option = gets&.strip
        exit if shop_option.nil?

        break if shop_option == "6"

        if ["1", "2", "3", "4", "5"].include?(shop_option)
          if pet.buy_item(shop_option)
            pet.finish_round(fed: shop_option == "1")
            break if pet.ran_away
          end
        else
          puts "Invalid choice. Please select 1-6."
        end
      end

    when "6"
      pet.update_needs
      puts "\nYour current balance is $#{pet.money}."

    when "7"
      puts "\n#{pet.name} says see you later!"
      puts "Thank you for playing Ruby Pet Simulator!"
      puts "Goodbye!"
      exit

    else
      puts "Invalid choice. Please select 1-7."

    end

    break if pet.ran_away
  end
end
