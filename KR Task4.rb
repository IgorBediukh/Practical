def abbreviation(words)
  abbreviations = words.split.map { |word| word[0] }

  abbreviation = abbreviations.join('').upcase

  return abbreviation
end

input_string = "центральний обробник одиниць"
result = abbreviation(input_string)
puts result
