require 'json'
require './student'
require './teacher'
require './book'

module PreserveData

  def save_rental(rental_list)
    File.open('data/rentals.json', mode: 'w')
    rental_list.each do |data|
      rental_person = [data.person.class, data.person.age, data.person.name, data.person.parent_permission]
      rental_book = [data.book.title, data.book.author]
      rental_data = [data.date, rental_book, rental_person]
      rental_json = JSON.generate(rental_data)
      File.write('data/rentals.json', "#{rental_json}\n", mode: 'a')
    end
    
  end

  def save_persons(persons_list)
    File.open('data/persons.json', mode: 'w')
    persons_list.each do |person|
      person_data = [person.class, person.name, person.age, person.parent_permission]
      person_json = JSON.generate(person_data)
      File.write('data/persons.json', "#{person_json}\n", mode: 'a')
    end
  end

  def save_books(books_list)
    File.open('data/books.json', mode: 'w')
    books_list.each do |book|
      book_data = [book.title, book.author]
      book_json = JSON.generate(book_data)
      File.write('data/books.json', "#{book_json}\n", mode: 'a')
    end
  end

  def read_persons
    return [] unless File.exist?('data/persons.json') && !File.zero?('data/persons.json')

    persons_list = []
    File.foreach('data/persons.json') do |person_json|
      person = JSON.parse(person_json)
      case person[0]
      when 'Student'
        stud = Student.new('none', person[2].to_i, person[1], parent_permission: person[3])
        persons_list.push(stud)
      when 'Teacher'
        teach = Teacher.new('Math', person[2].to_i, person[1])
        persons_list.push(teach)
      end
    end
    persons_list
  end

  def read_books
    return [] unless File.exist?('data/books.json') && !File.zero?('data/books.json')

    books_list = []
    File.foreach('data/books.json') do |book_json|
      book = JSON.parse(book_json)
      new_book = Book.new(book[0], book[1])
      books_list.push(new_book)
    end
    books_list
  end

  def read_rental
    return [] unless File.exist?('data/rentals.json') && !File.zero?('data/rentals.json')

    rental_list = []
    File.foreach('data/rentals.json') do |rental_json|
      rental_data = JSON.parse(rental_json)
      book = Book.new(rental_data[1][0], rental_data[1][1])
      case rental_data[2][0]
      when 'Student'
        stud = Student.new('None', rental_data[2][1], rental_data[2][2], parent_permission: rental_data[2][3])
        rental_list.push(Rental.new(rental_data[0], book, stud))
      when 'Teacher'
        teach = Teacher.new('None', rental_data[2][1], rental_data[2][2])
        rental_list.push(Rental.new(rental_data[0], book, teach))
      end
    end
    rental_list
  end



  
end