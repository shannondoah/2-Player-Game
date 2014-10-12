 require 'colorize'

 loop do
  puts "Welcome to Math: The Mathening. 2 players. Each get 3 lives. When ready, type 'start'. Player 1 begins. Type 'quit' to exit game."
  start = gets.chomp.downcase

  break if start == 'quit'

  @lives = {
    1 => 3,
    2 => 3
  }

  @player_turn = 1

  @operator = [:+, :-, :*]

  if start == 'start'
    loop do

      break if @lives[1] == 0 || @lives[2] == 0
      
      puts "Player #{@player_turn}: What is #{var1 = rand(1..20)} #{@operator.sample} #{var2 = rand(1..20)}?"
      user_input = gets.chomp
      answer = var1.send(@operator.sample, var2) 
      if user_input.to_i  != answer
        @lives[@player_turn] -= 1
        puts "Incorrect. Player #{@player_turn} has #{@lives[@player_turn]} lives remaining.".red
      else
        puts "Correct!".green
      end

      if @player_turn == 1
        @player_turn = 2
      else
        @player_turn = 1
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


