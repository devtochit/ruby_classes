require './app'
require './rental'
require './person_options'
require './book_option'
require './rental_option'
require './rental_list'
require './preserve_data'

class Main
  include App
  include PersonOptions
  include BookOption
  include RentalOption
  include RentalList
  include PreserveData

  def initialize
    @people_list = read_persons
    @books_list = read_books
    @rental_list = read_rental
  end

  def main
    puts 'Please choose an option by entering a number:'
    puts '[1] List of all Books'
    puts '[2] List of all People'
    puts '[3] Create a Person'
    puts '[4] Create a Book'
    puts '[5] Create a Rental'
    puts '[6] List of all Rentals by Person'
    puts '[7] List of all Rentals'
    puts '[8] Exit'
    user_choice = gets.chomp
    show_list(user_choice)
  end

  def show_list(user_choice)
    case user_choice
    when '1'
      list_of_books(@books_list)
      main
    when '2'
      list_of_people(@people_list)
      main
    when '6'
      show_rental
      main
    when '7'
      show_all(@rental_list)
      main
    else
      add_to_list(user_choice)
    end
  end

  def add_to_list(user_choice)
    case user_choice
    when '3'
      add_person(@people_list)
      main
    when '4'
      add_book(@books_list)
      main
    when '5'
      add_rental(@books_list, @people_list, @rental_list)
      main
    when '8'
      save_books(@books_list)
      save_persons(@people_list)
      save_rental(@rental_list)
      puts '---------------------------------------------'
      puts 'Good bye!'
      puts '---------------------------------------------'
    end
  end

  def welcome
    puts
    puts '---------------------------------------------'
    puts 'Welcome to School Library App!'
    puts '---------------------------------------------'
    puts
  end
end
