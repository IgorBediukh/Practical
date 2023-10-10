def roman_to_integer(roman)
  roman_numerals = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }

  result = 0
  prev_value = 0

  roman.reverse.each_char do |char|
    value = roman_numerals[char]

    if !value
      puts "Некоректний римський символ: #{char}"
      return
    end

    if value < prev_value
      result -= value
    else
      result += value
    end

    prev_value = value
  end

  result
end

def integer_to_roman(integer)
  roman_numerals = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }

  result = ''

  roman_numerals.each do |value, symbol|
    while integer >= value
      result += symbol
      integer -= value
    end
  end

  result
end

puts "Введіть римську цифру або ціле число:"
input = gets.chomp

if input.match?(/^\d+$/)
  integer = input.to_i
  if integer >= 1 && integer < 4000
    roman = integer_to_roman(integer)
    puts "Римська цифра: #{roman}"
  else
    puts "Некоректний діапазон числа (1 <= n < 4000)"
  end
elsif input.match?(/^[IVXLCDM]+$/)
  roman = input
  integer = roman_to_integer(roman)
  puts "Ціле число: #{integer}"
else
  puts "Некоректний ввід. Введіть або римську цифру, або ціле число."
end
