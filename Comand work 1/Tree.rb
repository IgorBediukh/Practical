require 'digest'

# Функція для обчислення хешу
def calculate_hash(data)
  Digest::SHA256.hexdigest(data)
end

# Функція для побудови Мерклівого дерева зі списку даних
def build_merkle_tree(data)
  return data[0] if data.length == 1

  # Створюємо новий список для збереження нових хешів
  new_data = []

  # Обходимо дані по парам і обчислюємо хеш для кожної пари
  data.each_slice(2) do |a, b|
    new_data << calculate_hash(a + b)
  end

  # Рекурсивно будуємо Меркліве дерево для нового списку хешів
  build_merkle_tree(new_data)
end

# Приклад даних для побудови Мерклівого дерева
data = [
  'транзакція1',
  'транзакція2',
  'транзакція3',
  'транзакція4'
]

# Будуємо Меркліве дерево
root_hash = build_merkle_tree(data)

puts "Кореневий хеш Мерклового дерева: #{root_hash}"
