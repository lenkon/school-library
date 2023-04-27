require_relative '../book'
require_relative '../student'

describe Book do
  before :each do
    @book = Book.new('Title1', 'Author1')
  end
  context 'book with title and author' do
    it 'book title: Title1, author: Author1' do
      expect(@book.title).to eq('Title1')
      expect(@book.author).to eq('Author1')
      expect(@book.rentals).to eq []
    end
  end

  context 'book rental, ' do
    it 'adding a book rental should have length of one' do
      @book.add_rental('2000/01/01', Student.new(11, nil, 'student1'))
      expect(@book.rentals.length).to eq(1)
    end
  end
end
