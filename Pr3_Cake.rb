def count_raisins(cake)
  cake.join.count('o')
end

def split_cake(cake, n)
  raisins = count_raisins(cake)
  return [] if raisins < n || raisins % n != 0

  target_raisins_per_piece = raisins / n
  current_raisins = 0
  current_piece = []
  result = []

  cake.each do |row|
    current_piece << row
    current_raisins += row.count('o')

    if current_raisins == target_raisins_per_piece
      result << current_piece
      current_piece = []
      current_raisins = 0
    elsif current_raisins > target_raisins_per_piece
      return []
    end
  end

  result
end

cake = [
  "........",
  "..o.....",
  "...o....",
  "........"
]

n = 2
result = split_cake(cake, n)

if result.empty?
  puts "Неможливо розрізати торт на #{n} частин"
else
  puts "Результат:"
  result.each do |piece|
    piece.each { |row| puts row }
    puts
  end
end