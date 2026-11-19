require_relative "pet_needs"
require_relative "activities"

class Pet
  include PetNeeds
  include Activities

  attr_accessor :name, :species, :hunger, :happiness,
                :energy, :health, :money

  def initialize(name, species)
    @name = name
    @species = species

    @hunger = 20
    @happiness = 80
    @energy = 90
    @health = 100
    @money = 100

    @last_update = Time.now
  end

  def display_stats
    update_needs

    puts "\n----- PET STATISTICS -----"
    puts "Name: #{@name}"
    puts "Species: #{@species}"
    puts "Hunger: #{@hunger}/100"
    puts "Happiness: #{@happiness}/100"
    puts "Energy: #{@energy}/100"
    puts "Health: #{@health}/100"
    puts "Mood: #{mood}"
    puts "Money: $#{@money}"
    puts "--------------------------"
  end

  def mood
    if @hunger >= 70
      "Hungry"
    elsif @energy <= 30
      "Tired"
    elsif @happiness <= 30
      "Sad"
    else
      "Happy"
    end
  end

  def earn_money(amount)
    @money += amount
    puts "You earned $#{amount}!"
    puts "Current balance: $#{@money}"
  end

  def buy_item(choice)
    update_needs

    case choice
    when "1"
      item = "Premium Food"
      price = 15
      if @hunger == 0
        puts "#{@name} is not hungry right now."
        return
      end
    when "2"
      item = "Toy"
      price = 20
      if @happiness == 100
        puts "#{@name} is already very happy!"
        return
      end
    when "3"
      item = "Energy Snack"
      price = 15
      if @energy == 100
        puts "#{@name} already has full energy!"
        return
      end
    when "4"
      item = "Medicine"
      price = 30
      if @health == 100
        puts "#{@name} is already healthy!"
        return
      end
    when "5"
      item = "Treat"
      price = 5
      if @happiness == 100
        puts "#{@name} is already very happy!"
        return
      end
    else
      puts "Invalid item choice."
      return
    end

    if @money < price
      puts "You don't have enough money!"
      puts "You need $#{price}, but you only have $#{@money}."
      return
    end

    @money -= price

    case choice
    when "1"
      @hunger = [@hunger - 30, 0].max
    when "2"
      @happiness = [@happiness + 25, 100].min
    when "3"
      @energy = [@energy + 20, 100].min
    when "4"
      @health = [@health + 25, 100].min
    when "5"
      @happiness = [@happiness + 10, 100].min
    end

    puts "\nYou purchased #{item}!"
    puts "#{@name} appreciates it!"
    puts "You spent $#{price}."
    puts "Remaining balance: $#{@money}"
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
