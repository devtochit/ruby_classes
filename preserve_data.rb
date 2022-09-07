require 'json'
require './student'
require './book'
require './rentals'

module PreserveData

    def save_rental(rental_list)
        File.open('data/rentals.json', mode:'w')
        rental_list.list.each do |data|
            rental_person = [data.person.class,
        data.person.age, data.person.name,
        data.person.parent_permission]
        rental_book = [data.book.title,data.book.author]
        rental_data = [data.date, rental_book, rental_person]
        rental_json = JSON.generate(rental_data)
        File.write('data/rentals.json', "{rental_json", mode:a)
        end
    end
    
end