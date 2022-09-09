require './app'
require './book'

module BookOption
  include App

  def add_book(books_list)
    puts 'In order to create a new Book we need some information first...'
    puts 'What is the title of the Book?'
    book_title = gets.chomp
    puts 'Who is the Author?'
    book_author = gets.chomp
    add_book_list(books_list, Book.new(book_title, book_author))
  end
end
