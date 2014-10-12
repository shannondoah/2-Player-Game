 require 'colorize'

class Player
  def initialize(name)
    @name = name
    @lives = 5
  end
end
#use of instance variables means those variables will be unique to each instance of a class

# Looks at the @lives and gets the next key value pair.
def next_player
  if @switch.next != nil
    @current_player = @switch.next
  else
    @current_player = @switch.first
  end
  # @current_player = @lives.each.next
  # @current_player = @lives.map.with_index {|(name,lives),index| index += 1 } #should be equal to the next key value pair in the hash
end

loop do
  puts "Welcome to Math: The Mathening. How many players?"
  number = gets.chomp.to_i 

  @lives = Hash.new 

  number.times do |x|
    puts "Player Name?"
    name = gets.chomp
    @lives[name] = 3
  end

  @switch = @lives.each
  @current_player = @switch.next 
  @player_name = @current_player[0]
  @current_lives = @current_player[1]
  @operator = [:+, :-, :*]

  puts "You have #{number} players. Each gets 3 lives. When you answer a question incorrectly, you lose a life. When you answer correctly, you get nothing. This is called survival. When ready, type 'start'. #{@player_name} begins. Type 'quit' to exit game."
  start = gets.chomp.downcase

  break if start == 'quit'


  if start == 'start' 
    loop do

      break if @current_lives == 0
      
      puts "Player #{@player_name}: What is #{var1 = rand(1..20)} #{op = @operator.sample} #{var2 = rand(1..20)}?"
      user_input = gets.chomp
      answer = var1.send(op, var2)
      
      if user_input.to_i != answer
        @current_lives -= 1
        puts "Incorrect. Player #{@player_name} has #{@current_lives} lives remaining.".red
      else
        puts "Correct!".green
      end
    end
    puts "Game over! Play again? Y/N".yellow
    play_again = gets.chomp.upcase
      if play_again == 'N'
        exit
      end
  else 
    puts "Command not recognized.".red
  end
end


# For multiple players - ask how many players. Ask for player names x times and pass those names in as keys in a hash, with each key having the same value. Must also iterate through all player turns instead of switching, and then collect the players score if they restart the game.