module App
  def list_of_books(books_list)
    puts 'List of Books:'
    if books_list.empty?
      puts '---------------------------------------------'
      puts 'The Book\'s list is empty'
      puts '---------------------------------------------'
    else
      books_list.map do |book|
        puts '---------------------------------------------'
        puts "Title: #{book.title} - Author: #{book.author}"
        puts '---------------------------------------------'
      end
    end
  end

  def list_of_people(people_list)
    puts 'List of Persons:'
    if people_list.empty?
      puts '---------------------------------------------'
      puts 'People\'s list is empty'
      puts '---------------------------------------------'
    else
      people_list.map do |person|
        puts '---------------------------------------------'
        puts "Name: #{person.name} - ID: #{person.id} - Age: #{person.age}"
        puts '---------------------------------------------'
      end
    end
  end

  def list_of_rentals(rental_list)
    if rental_list.empty?
      puts '---------------------------------------------'
      puts 'The Rental\'s list is empty'
      puts '---------------------------------------------'
    else
      rental_list.map do |rent|
        puts '---------------------------------------------'
        puts "Date: #{date} - Book: #{rent.book.title} - Name: #{rent.person.name}"
        puts '---------------------------------------------'
      end
    end
  end

  def filter_by_id(rental_list, name)
    rental_list.each do |rent|
      next if rent.person.name != name

      puts '---------------------------------------------'
      puts "Date: #{rent.date}"
      puts "Rented to: #{rent.person.name}"
      puts "Title: #{rent.book.title}"
      puts "Author: #{rent.book.author}"
      puts '---------------------------------------------'
    end
  end

  def add_person_list(people_list, person)
    people_list.push(person)
  end

  def add_book_list(books_list, book)
    books_list.push(book)
    puts '---------------------------------------------'
    puts 'The Book was created successfully!'
    puts '---------------------------------------------'
  end

  def add_rental_list(rental_list, rent)
    rental_list.push(rent)
    puts '---------------------------------------------'
    puts 'The Rental was created successfully!'
    puts '---------------------------------------------'
  end
end
