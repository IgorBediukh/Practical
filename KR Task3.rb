class Book
  attr_accessor :title, :author, :publication_year

  def initialize(title, author, publication_year)
    @title = title
    @author = author
    @publication_year = publication_year
  end

  def to_s
    "#{@title} - #{@author} (#{@publication_year})"
  end
end

book1 = Book.new("Пригоди Гаррі Поттера", "Дж. К. Роулінг", 1997)
book2 = Book.new("Майстер і Маргарита", "Михайло Булгаков", 1967)

puts "Книга 1: #{book1}"
puts "Книга 2: #{book2}"

book1.title = "Нова назва книги"
book1.author = "Новий автор"
book1.publication_year = 2020

puts "Оновлена книга 1: #{book1}"
