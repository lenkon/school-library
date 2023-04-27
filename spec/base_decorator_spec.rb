require_relative '../base_decorator'
require_relative '../nameable'
require_relative '../teacher'

describe BaseDecorator do
  before :each do
    @teacher = Teacher.new(55, 'Specialization1', 'Teacher1')
    @base_decorator = BaseDecorator.new(@teacher)
  end

  context 'base decorator test 1' do
    it 'should have' do
      expect(@base_decorator).to be_kind_of Nameable
      expect(@base_decorator).to be_instance_of BaseDecorator
      expect(@base_decorator.correct_name).to eq 'Teacher1'
    end
  end

  context 'base decorator test 2' do
    it 'should have' do
      teacher = Teacher.new(33, 'Specialization2', 'Teacher2')
      base_decorator = BaseDecorator.new(teacher)
      expect(base_decorator.correct_name).to eq 'Teacher2'
    end
  end
end
