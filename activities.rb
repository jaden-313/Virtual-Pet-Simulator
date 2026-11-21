module Activities


  def feed
    update_needs

    if @hunger <= 5
      puts "\n#{@name} is already full and doesn't want to eat!"
      return false
    end

    @hunger = [@hunger - 30, 0].max

    puts "\n#{@name} has been fed!"
    puts "Hunger level is now #{@hunger}/100."

    earn_money(2)
    true
  end


  def play
    update_needs

    if @energy < 10
      puts "#{@name} is too tired to play."
      return
    end

    @happiness = [@happiness + 15, 100].min
    @energy = [@energy - 10, 0].max
    @hunger = [@hunger + 10, 100].min

    puts "\nYou played with #{@name}!"
    puts "#{@name} is having fun!"

    puts "Happiness: #{@happiness}/100"
    puts "Energy: #{@energy}/100"
    puts "Hunger: #{@hunger}/100"

    earn_money(5)
  end

  def sleep
    update_needs

    @energy = [@energy + 30, 100].min
    @hunger = [@hunger + 10, 100].min

    puts "\n#{@name} took a nap."
    puts "Energy level is now #{@energy}/100."
    puts "Hunger level is now #{@hunger}/100."

    earn_money(2)
  end

end
