require './rental'

describe Rental do
  context 'When testing Rental class' do
    before :each do
      @teacher = Teacher.new('Math', 35, 'Sam')
      @book = Book.new('Foundation', 'Isaac Asimov')
    end
    it 'create a new rental automatically assign it to the person' do
      Rental.new('2022-09-01', @book, @teacher)
      expect(@teacher.rentals[0].book.title).to eq 'Foundation'
    end
    it 'create a new rental automatically assign it to the book' do
      Rental.new('2022-09-01', @book, @teacher)
      expect(@book.rentals[0].person.name).to eq 'Sam'
    end
  end
end
