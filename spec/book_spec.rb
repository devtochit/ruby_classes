require './book'

describe Book do
  context 'When testing the Book class' do
    it 'Should show the Title of the book' do
      book = Book.new('Foundation', 'Isaac Asimov')
      expect(book.title).to eq 'Foundation'
    end
    it 'Should show the Author of the book' do
      book = Book.new('Foundation', 'Isaac Asimov')
      expect(book.author).to eq 'Isaac Asimov'
    end
  end
end