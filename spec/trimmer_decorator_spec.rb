require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new(15, 'Expandedname')
    @trimmer_decorator = TrimmerDecorator.new(@person)
  end

  context 'trimmer decorator test' do
    it 'should have' do
      expect(@trimmer_decorator).to be_kind_of BaseDecorator
      expect(@trimmer_decorator).to be_instance_of TrimmerDecorator
      expect(@trimmer_decorator.correct_name).to eq 'Expandedna'
    end
  end

  context 'trimmer_decorator.correct_name test' do
    it 'should have trimmed name' do
      @person.name = 'Expandedname'
      expect(@trimmer_decorator.correct_name).to eq 'Expandedna'
    end
  end
end
