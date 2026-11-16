class Pet
    attr_accessor :name, :species, :hunger, :happiness, :energy, :health
    def initialize(name, species)
        @name = name
        @species = species

        @hunger = 20
        @happiness = 80
        @energy = 90
        @health = 100
    end
    
    def display_stats
        puts "Name: #{@name}"
        puts "Species: #{@species}"
        puts "Hunger: #{@hunger}"
        puts "Happiness: #{@happiness}"
        puts "Energy: #{@energy}"
        puts "Health: #{@health}"
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



