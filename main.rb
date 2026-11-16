
require_relative "pet"

# Pet Adoption
puts "Welcome to Ruby Pet Adoption Center!"

choice = ""

while choice != "1" && choice != "2" && choice != "3" && choice != "4"
  puts "Choose your pet:"
  puts "1. Cat"
  puts "2. Dog"
  puts "3. Rabbit"
  puts "4. Horse"

  choice = gets.chomp

  if choice != "1" && choice != "2" && choice != "3" && choice != "4"
    puts "Invalid choice. Please select 1, 2, 3, or 4."
  end
end

puts "What would you like to name your pet?"
name = ""

while name.empty?
  name = gets.chomp.strip.capitalize

  if name.empty?
    puts "Please enter a valid name for your pet."
  end
end

if choice == "1"
  pet = Cat.new(name)
elsif choice == "2"
  pet = Dog.new(name)
elsif choice == "3"
  pet = Rabbit.new(name)
elsif choice == "4"
  pet = Horse.new(name)  
end

puts "Congratulations! You've adopted a #{pet.species} named #{pet.name}."

pet.display_stats
pet.make_sound
