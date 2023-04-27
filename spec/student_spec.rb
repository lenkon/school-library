require_relative '../student'
require_relative '../classroom'

describe Student do
  before :each do
    @student = Student.new(13, nil, 'James Kithinji', parent_permission: false)
  end

  context 'When a new instance of the Student class is instantiated' do
    it 'should have' do
      expect(@student.age).to eq 13
      expect(@student.name).to eq 'James Kithinji'
      expect(@student.can_use_services?).to be false
      expect(@student.classroom).to be nil
    end
  end

  context 'When a classroom is assigned to a newly created student' do
    it 'should have same classroom as in contructor' do
      classroom = Classroom.new('6N')
      student = Student.new(28, classroom, 'Anne Chege')
      expect(student.classroom.label).to eq '6N'
    end
  end

  context 'When the classroom for a student is assigned' do
    it 'should have the set class' do
      classroom = Classroom.new('5N')
      @student.classroom = classroom
      expect(@student.classroom.label).to eq '5N'
    end
  end

  context 'When the play hooky method is examined' do
    it 'should return ¯\(ツ)/¯' do
      expect(@student.play_hooky).to eq '¯\\(ツ)/¯'
    end
  end
end
