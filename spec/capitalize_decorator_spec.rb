require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(7, 'Person1')
    @capitalize_decorator = CapitalizeDecorator.new(@person)
  end

  context 'capitalize decorator creation test' do
    it 'should have' do
      expect(@capitalize_decorator).to be_instance_of CapitalizeDecorator
      expect(@capitalize_decorator).to be_kind_of BaseDecorator
      expect(@capitalize_decorator.correct_name).to eq 'Person1'
    end
  end

  context 'capitalize_decorator.correct_name test' do
    it 'should have capitalized name' do
      @person.name = 'person1'
      expect(@capitalize_decorator.correct_name).to eq 'Person1'
    end
  end
end
