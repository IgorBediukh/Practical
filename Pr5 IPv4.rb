def valid_ipv4?(str)
  # Розділяємо строку на частини, використовуючи крапки як роздільники
  parts = str.split(".")

  # Перевіряємо, чи є рівно 4 частини
  return false unless parts.length == 4

  # Перевіряємо кожну частину
  parts.each do |part|
    # Перевіряємо, чи частина є цілим числом
    return false unless part.match?(/^\d+$/)

    # Перевіряємо, чи число знаходиться в діапазоні від 0 до 255
    num = part.to_i
    return false unless num >= 0 && num <= 255

    # Перевіряємо, чи немає ведучих нулів (крім самого нуля)
    return false unless part.to_i.to_s == part
  end

  # Якщо всі перевірки виконані успішно, повертаємо true
  true
end

# Приклади використання:
puts valid_ipv4?("192.168.1.1")  # true
puts valid_ipv4?("0.0.0.0")      # true
puts valid_ipv4?("255.255.255.255")  # true
puts valid_ipv4?("256.0.0.1")    # false (число більше 255)
puts valid_ipv4?("192.168.01.1")  # false (ведучі нулі)
puts valid_ipv4?("192.168.1.1.1")  # false (забагато частин)
puts valid_ipv4?("192.168.1")     # false (замало частин)
