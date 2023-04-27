require_relative '../book'
require_relative '../student'

describe Person do
  before :each do
    @person = Person.new(29, 'Peter Kibor')
  end

  context 'When a new individual is created' do
    it 'should have' do
      expect(@person.age).to eq 29
      expect(@person.name).to eq 'Peter Kibor'
      expect(@person.rentals).to eq []
      expect(@person.can_use_services?).to eq true
    end
  end

  context 'when a person rents out a book' do
    it 'should have' do
      @person.add_rental('2023/04/27', Book.new('Maths', 'Allan Jackson'))
      @person.add_rental('2023/04/21', Book.new('English', 'Ken Mwenda'))
      expect(@person.rentals.length).to be 2
      expect(@person.rentals[0].book.title).to eq 'Maths'
      expect(@person.rentals[1].book.title).to eq 'English'
    end
  end

  context 'When an individual is instantiated with an alternate name' do
    it 'should return the name in constructor' do
      person = Person.new(41, 'Karimi Muriungi')
      expect(person.correct_name).to eq 'Karimi Muriungi'
    end
  end

  context 'when a person is created it' do
    it 'should be able to use services' do
      person = Person.new(43, 'Kiboswo Kibor')
      expect(person.can_use_services?).to be true
    end
  end
end
