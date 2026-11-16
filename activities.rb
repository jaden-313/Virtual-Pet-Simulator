class Pet
  def feed
    @hunger = [@hunger - 20, 0].max
    puts "#{@name} has been fed. Hunger level is now #{@hunger}/100."
  end

  def play
    @happiness = [@happiness + 15, 100].min
    @energy = [@energy - 10, 0].max
    @hunger = [@hunger + 10, 100].min
    puts "You played with #{@name}! Happiness level is now #{@happiness}/100, energy level is #{@energy}/100, and hunger level is #{@hunger}/100."
  end

  def sleep
    @energy = [@energy + 30, 100].min
    @hunger = [@hunger + 10, 100].min
    puts "#{@name} took a nap. Energy level is now #{@energy}/100 and hunger level is #{@hunger}/100."
  end