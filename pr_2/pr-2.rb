precedence = {'+' => 1, '-' => 1, '*' => 2, '/' => 2, '^' => 3}
output = []
stack = []

input_expression = "2 + 1 * 4"

input_expression.each_char do |char|
  if char.match?(/\d/)
    output << char
  elsif '+-*/^'.include?(char)
    while !stack.empty? && '+-*/^'.include?(stack.last) &&
      precedence[char] <= precedence[stack.last]
      output << stack.pop
    end
    stack << char
  elsif char == '('
    stack << char
  elsif char == ')'
    while !stack.empty? && stack.last != '('
      output << stack.pop
    end
    stack.pop
  end
end

output.concat(stack.reverse)

output_expression = output.join(' ')

puts "Input --> #{input_expression}"
puts "Output --> #{output_expression}"