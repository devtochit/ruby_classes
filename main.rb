# rubocop:disable Metrics/CyclomaticComplexity
require_relative './app'
def init
  puts "Please choose an option by entering a number:
        1 - List all books
        2 - List all people
        3 - Create a person
        4 - Create a book
        5 - Create a rental
        6 - List all rentals for a given person ID
        7 - Exit

      Enter your option here:"
end

def run_option(option, app)
  case option
  when 1
    app.list_books
  when 2
    app.list_people
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_rentals
  when 7
    app.quit_app
  else p 'Please enter a valid option, number from 1 to 7'
  end
end

def main
  app = App.new
  option = 0
  puts 'Welcome to School Library Rental App!'
  while option != 7
    init
    option = gets.chomp.to_i
    if option.positive? && option < 7
      run_option(option, app)
    elsif option == 7
      puts 'Thanks for using this App!'
    else
      puts 'Invalid option'
    end
  end
end

main
<<<<<<< HEAD
# rubocop:enable Metrics/CyclomaticComplexity
=======
>>>>>>> f2287766fcccd984e547f05bb8699ce9c49b346b
