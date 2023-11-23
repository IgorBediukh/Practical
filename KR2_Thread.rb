mutex = Mutex.new
cv = ConditionVariable.new

# Перший потік
thread1 = Thread.new do
  mutex.synchronize do
    (1..10).each do |i|
      puts "Thread 1: #{i}"
      cv.signal  # Сигнал іншому потоку
      cv.wait(mutex)  # Чекаємо на сигнал від іншого потоку
    end
  end
end

# Другий потік
thread2 = Thread.new do
  mutex.synchronize do
    (1..10).each do |i|
      cv.wait(mutex)  # Чекаємо на сигнал від іншого потоку
      puts "Thread 2: #{i}"
      cv.signal  # Сигнал іншому потоку
    end
  end
end

# Запускаємо потоки
thread1.join
thread2.join
