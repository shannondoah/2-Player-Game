 require 'colorize'

class Player
  
  @@full_life = 3

  def initialize(name)
    @name = name
    @lives = @@full_life
  end

  def self.get_player_name
    puts "Please enter your name."
    name = gets.chomp
    Player.new(name)
  end

  def lose_life
    self.lives -= 1
    puts "Incorrect! #{@name} has #{@lives} lives remaining!".red
  end

  def switch_player
    if @current_player = @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  attr_accessor :name, :lives
end


 loop do
  puts "Welcome to Math: The Mathening. You are allowed 2 players. Each gets 3 lives. When you answer a question incorrectly, you lose a life. When you answer correctly, you get nothing but the bitter resolve of survival. Let's get started."

  @player1 = Player.get_player_name

  @player2 = Player.get_player_name

  puts "Welcome, #{@player1.name} and #{@player2.name}. When you are ready to begin, type 'start'. #{@player1.name} goes first. If you have changed your mind, type 'quit' to exit the game."
  start = gets.chomp.downcase

  break if start == 'quit'

  @current_player = @player1

  @operator = [:+, :-, :*]

  if start == 'start'
    loop do

      break if @player1.lives == 0 || @player2.lives == 0
      
      puts "Player #{@current_player.name}: What is #{var1 = rand(1..20)} #{op = @operator.sample} #{var2 = rand(1..20)}?"
      user_answer = gets.chomp
      comp_answer = var1.send(op, var2) 
      if user_answer.to_i  != comp_answer
        @current_player.lose_life
      else
        puts "Correct!".green
      end
      @current_player.switch_player 
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


