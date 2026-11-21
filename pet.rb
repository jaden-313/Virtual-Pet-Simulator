
require_relative "activities"
require_relative "pet_needs"

class Pet
  include Activities
  include PetNeeds

  attr_accessor :name, :species, :hunger, :happiness, :energy, :health
  attr_reader :money, :hungry_rounds, :ran_away

  SHOP_ITEMS = {
    "1" => { name: "Premium Food", price: 15, stat: :hunger, change: -30 },
    "2" => { name: "Toy", price: 20, stat: :happiness, change: 25 },
    "3" => { name: "Energy Snack", price: 15, stat: :energy, change: 20 },
    "4" => { name: "Medicine", price: 30, stat: :health, change: 25 },
    "5" => { name: "Treat", price: 5, stat: :happiness, change: 10 }
  }.freeze

  def initialize(name, species)
    @name = name
    @species = species
    @hunger = 20
    @happiness = 80
    @energy = 90
    @health = 100
    @money = 100
    @last_update = Time.now
    @hungry_rounds = 0
    @ran_away = false
  end

  def display_stats
    update_needs

    puts "Name: #{@name}"
    puts "Species: #{@species}"
    puts "Hunger: #{@hunger}/100"
    puts "Happiness: #{@happiness}/100"
    puts "Energy: #{@energy}/100"
    puts "Health: #{@health}/100"
    puts "High-hunger rounds: #{@hungry_rounds}/3"
  end

  def earn_money(amount)
    @money += amount
    puts "You earned $#{amount}!"
    puts "Current balance: $#{@money}"
  end

  def buy_item(choice)
    update_needs
    item = SHOP_ITEMS[choice]
    return false unless item

    if choice == "1" && @hunger <= 5
      puts "\n#{@name} is already full and doesn't need more food!"
      return false
    end

    if @money < item[:price]
      puts "You don't have enough money to buy #{item[:name]}!"
      return false
    end

    old_value = public_send(item[:stat])
    new_value = [[old_value + item[:change], 0].max, 100].min

    if new_value == old_value
      puts "#{@name} doesn't need #{item[:name]} right now."
      return false
    end

    @money -= item[:price]
    public_send("#{item[:stat]}=", new_value)

    puts "\nYou bought #{item[:name]} for $#{item[:price]}!"
    puts "#{item[:stat].to_s.capitalize}: #{new_value}/100"
    puts "Remaining balance: $#{@money}"

    true
  end


  def finish_round(fed: false)
    update_needs

    unless fed
      @hunger = [@hunger + 5, 100].min
    end

    update_health

    if @hunger >= 80
      @hungry_rounds += 1

      puts "\n#{@name} is very hungry! (#{@hunger}/100)"
      puts "Warning: #{@hungry_rounds}/3 hungry rounds."

      if @hungry_rounds >= 3
        @ran_away = true
        puts "\n#{@name} ran away because they were too hungry!"
        puts "You need to adopt a new pet."
      end
    else
      if @hungry_rounds > 0
        puts "\n#{@name} is no longer starving!"
        puts "Hunger warning has been reset."
      end

      @hungry_rounds = 0
    end
  end
end

class Cat < Pet
  def initialize(name)
    super(name, "Cat")
  end

  def make_sound
    puts "#{@name} says: Meow!"
  end
end

class Dog < Pet
  def initialize(name)
    super(name, "Dog")
  end

  def make_sound
    puts "#{@name} says: Woof!"
  end
end

class Rabbit < Pet
  def initialize(name)
    super(name, "Rabbit")
  end

  def make_sound
    puts "#{@name} says: Squeak!"
  end
end

class Horse < Pet
  def initialize(name)
    super(name, "Horse")
  end

  def make_sound
    puts "#{@name} says: Neigh!"
  end
end
