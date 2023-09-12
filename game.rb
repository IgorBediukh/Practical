if ARGV.length != 1
    puts "Використання: ruby game.rb [камінь|ножиці|папір] [камінь|ножиці|папір]"
    exit(1)
  end
  
  # Можливі варіанти вибору
  choices = ["камінь", "ножиці", "папір"]
  
  # Отримання вибору гравця та комп'ютера
  player_choice = ARGV[0].downcase
  computer_choice = choices.sample
  
  puts "Гравець вибрав: #{player_choice.capitalize}"
  puts "Комп'ютер вибрав: #{computer_choice.capitalize}"
  
  # Логіка гри та визначення переможця
  if player_choice == computer_choice
    puts "Нічия!"
  elsif (player_choice == "камінь" && computer_choice == "ножиці") ||
        (player_choice == "ножиці" && computer_choice == "папір") ||
        (player_choice == "папір" && computer_choice == "камінь")
    puts "Ви виграли!"
  else
    puts "Ви програли!"
  end