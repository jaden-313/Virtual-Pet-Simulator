module PetNeeds

  def update_needs
    current_time = Time.now
    elapsed_time = current_time - @last_update

    minutes = (elapsed_time / 60).floor

    return if minutes <= 0

    minutes.times do
      @hunger = [@hunger + 5, 100].min
      @happiness = [@happiness - 2, 0].max
      @energy = [@energy - 3, 0].max

      update_health
    end

    @last_update += minutes * 60

    puts "#{@name}'s needs have changed!"
  end

  def update_health
    if @hunger >= 100
      @health = [@health - 10, 0].max
      puts "#{@name} is extremely hungry! Health decreased by 10."

    elsif @energy <= 0
      @health = [@health - 5, 0].max
      puts "#{@name} is exhausted! Health decreased by 5."

    elsif @happiness <= 0
      @health = [@health - 5, 0].max
      puts "#{@name} is very unhappy! Health decreased by 5."

    elsif @hunger < 30 &&
          @energy > 50 &&
          @happiness > 50 &&
          @health < 100

      @health = [@health + 2, 100].min
      puts "#{@name} is recovering! Health increased by 2."
    end

    if @health == 0
      puts "#{@name}'s health has reached zero!"
    end
  end

end
