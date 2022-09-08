require './app'

module RentalList
  include App

  def show_rental(rental_list, people_list)
    if rental_list.empty? || people_list.empty?
      puts 'List of Rentals:'
      puts '---------------------------------------------'
      puts 'Nothing to show'
      puts '---------------------------------------------'
    else
      puts 'Choose Person entering his number:'
      people_list.each_with_index { |person, index| puts "[#{index}] #{person.name} - ID: #{person.id}" }
      pos = gets.chomp.to_i
      puts 'List of Rentals:'
      filter_by_id(rental_list, rental_list[pos].person.name)
    end
  end

  def show_all(rental_list)
    rental_list.each do |rental|
      puts '---------------------------------------------'
      puts "Date: #{rental.date}"
      puts "Rented to: #{rental.person.name}"
      puts "Title: #{rental.book.title}"
      puts "Author: #{rental.book.author}"
      puts '---------------------------------------------'
    end
  end
end
