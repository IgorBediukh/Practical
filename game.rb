if ARGV.length != 1
    puts "Usage: ruby game.rb [stone|scissors|paper]"
    exit(1)
  end

  choices = ["stone", "scissors", "paper"]
  player_choice = ARGV[0].downcase
  computer_choice = choices.sample
  
  puts "Player chose: #{player_choice.capitalize}"
  puts "Computer chose: #{computer_choice.capitalize}"
  
  if player_choice == computer_choice
    puts "It's a tie!"
  elsif (player_choice == "stone" && computer_choice == "scissors") ||
        (player_choice == "scissors" && computer_choice == "paper") ||
        (player_choice == "paper" && computer_choice == "stone")
    puts "You win!"
  else
    puts "You lose!"
  end
  