require_relative "pet"

# Pet Adoption
puts "===================================="
puts " Welcome to Ruby Pet Adoption Center!"
puts "===================================="

# Choose a pet
choice = ""

while !["1", "2", "3", "4"].include?(choice)

  puts "\nChoose your pet:"
  puts "1. Cat"
  puts "2. Dog"
  puts "3. Rabbit"
  puts "4. Horse"

  choice = gets.chomp

  unless ["1", "2", "3", "4"].include?(choice)
    puts "Invalid choice. Please select 1, 2, 3, or 4."
  end

end

# Enter pet name
puts "\nWhat would you like to name your pet?"

name = ""

while name.empty?

  name = gets.chomp.strip.capitalize

  if name.empty?
    puts "Please enter a valid name for your pet."
  end

end

# Create pet
case choice
when "1"
  pet = Cat.new(name)
when "2"
  pet = Dog.new(name)
when "3"
  pet = Rabbit.new(name)
when "4"
  pet = Horse.new(name)
end

# Welcome the new pet
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

  option = gets.chomp

  case option

  when "1"
    pet.feed

  when "2"
    pet.play

  when "3"
    pet.sleep

  when "4"
    pet.display_stats

  when "5"

    # Pet Shop
    shop_option = ""

    while shop_option != "6"

      puts "\n===================================="
      puts "              PET SHOP"
      puts "===================================="

      puts "Your balance: $#{pet.money}"
      puts ""
      puts "1. Premium Food - $15 (Hunger -30)"
      puts "2. Toy - $20 (Happiness +25)"
      puts "3. Energy Snack - $15 (Energy +20)"
      puts "4. Medicine - $30 (Health +25)"
      puts "5. Treat - $5 (Happiness +10)"
      puts "6. Return to main menu"

      puts "\nWhat would you like to buy?"

      shop_option = gets.chomp

      if ["1", "2", "3", "4", "5"].include?(shop_option)
        pet.buy_item(shop_option)
      elsif shop_option != "6"
        puts "Invalid choice. Please select 1-6."
      end

    end

  when "6"
    puts "\nYour current balance is $#{pet.money}."

  when "7"
    puts "\n#{pet.name} says goodbye!"
    puts "Thank you for playing Ruby Pet Simulator!"
    puts "Goodbye!"
    break

  else
    puts "Invalid choice. Please select 1-7."

  end

end
