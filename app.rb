# rubocop:disable Metrics/CyclomaticComplexity

require './book'
require './person'
require './rental'
require './student'
require './teacher'
class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  puts 'Welcome to School Library App!'

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
    option = gets.chomp.to_i
    run_option(option)
  end

  def run_option(option)
    case option
    when 1 then list_books
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals
    when 7 then quit_app
    else p 'Please enter a valid option, number from 1 to 7'
         init
    end
  end

  def list_books
    puts 'Book list'
    puts 'No books added yet' if @books.empty?
    @books.each { |book| puts("Title: #{book.title} - Author: #{book.author}") }
    init
  end

  def list_people
    puts 'People list'
    puts 'No people added yet' if @people.empty?
    @people.each { |person| puts person.name }
    init
  end

  def create_person
    puts 'Are you a:
    1 - Student
    2 - Teacher'
    person_input = gets.chomp.to_i
    case person_input
    when 1 then create_student
    when 2 then create_teacher
    else p 'Please enter a valid option, number 1 or 2'
         create_person
    end
  end

  def create_student
    puts 'Enter your name'
    name = gets.chomp
    puts 'Enter your age'
    age = gets.chomp.to_i
    puts 'Enter classroom'
    classroom = gets.chomp
    parent_permission = parent_permission?
    @people.push(Student.new(age, classroom, name, parent_permission: parent_permission))
    puts 'Student created'
    init
  end

  def parent_permission?
    puts 'Do you have parent permission? Y/N'
    parent_permission = gets.chomp.upcase
    case parent_permission
    when 'Y' then true
    when 'N' then false
    else p 'Enter a valid value: Y or N'
         parent_permission?
    end
  end

  def create_teacher
    puts 'Enter your name'
    name = gets.chomp
    puts 'Enter your age'
    age = gets.chomp.to_i
    puts 'Enter your specialization'
    specialization = gets.chomp
    @people.push(Teacher.new(age, specialization, name))
    puts 'Teacher created'
    init
  end

  def create_book
    puts 'Write book\'s title'
    input_title = gets.chomp
    puts 'Write book\'s author'
    input_author = gets.chomp
    @books.push(Book.new(input_title, input_author))
    puts 'Book Created'
    init
  end

  def create_rental
    puts 'Select a book by its number'
    @books.each_with_index do |book, index|
      puts "Number: #{index} - Title: #{book.title}, Author: #{book.author}"
    end
    book_id_input = gets.chomp.to_i
    book = @books[book_id_input]
    puts 'Select the person who is renting a book by its number (not ID)'
    @people.each_with_index do |person, index|
      puts "Number: #{index} - Role: #{person.class.name}, name: #{person.name}, ID: #{person.id}"
    end
    person_id_input = gets.chomp.to_i
    person = @people[person_id_input]
    puts 'Enter date [yyyy-mm-dd]'
    date = gets.chomp
    @rentals.push(Rental.new(person, book, date))
    puts 'OMG you rented a book!'
    init
  end

  def list_rentals
    puts 'No rentals yet' if @rentals.empty?
    puts 'Enter a person ID'
    person_id_input = gets.chomp
    selected_person = @people.find { |person| person.id == person_id_input }
    puts 'This person has no rentals yet' if selected_person.rentals.empty?
    selected_rentals = selected_person.rentals
    selected_rentals.each do |rental|
      puts "Name: #{rental.person.name}, Book: #{rental.book.title} - #{rental.book.author}, Date: #{rental.date}"
    end
    init
  end

  def quit_app
    p 'Thanks for usig School Library App, Bye'
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rentals.person.id
