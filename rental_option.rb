require './rental'
require './app'

module RentalOption
  include App

  def add_rental(books_list, people_list, rental_list)
    if books_list.empty? || people_list.empty?
      puts '---------------------------------------------'
      puts 'The list of Book/People\'s is empty!'
      puts '---------------------------------------------'
    else
      select_book(books_list)
      book_idx = gets.chomp.to_i
      select_person(people_list)
      person_idx = gets.chomp.to_i
      puts 'Date? (format yyyy-mm-dd)'
      date = gets.chomp
      add_rental_list(rental_list, Rental.new(date, books_list[book_idx], people_list[person_idx]))
    end
  end

  def select_book(books_list)
    puts 'In order to create a New Rental, we need some information first...'
    puts 'Select a Book:'
    books_list.each_with_index do |book, i|
      puts "[#{i}] #{book.title} - #{book.author}"
      puts '---------------------------------------------'
    end
  end

  def select_person(people_list)
    puts 'Select a Person:'
    people_list.each_with_index do |person, i|
      puts "[#{i}] #{person.name} - #{person.id}"
      puts '---------------------------------------------'
    end
  end
end
