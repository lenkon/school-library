require './list'
require './book'
require './rental'
require './student'
require './teacher'

class Create
  def self.create_student(people)
    puts
    print 'Age: '
    age = gets.chomp.strip.to_i

    while age < 4 || age > 120
      print 'Enter correct age: '
      age = gets.chomp.strip.to_i
    end

    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.strip.upcase

    case permission
    when 'Y' || 'y'
      permission = true
    when 'N' || 'n'
      permission = false
    end

    people << Student.new(age, nil, name, parent_permission: permission)
    puts 'Person created successfully'
    puts
  end

  def self.create_teacher(people)
    puts
    print 'Age: '
    age = gets.chomp.strip.to_i
    while age < 18 || age > 120
      print 'Enter correct age: '
      age = gets.chomp.strip.to_i
    end
    print 'Name: '
    name = gets.chomp.strip.capitalize
    print 'Specialization: '
    specialization = gets.chomp.strip
    people << Teacher.new(age, specialization, name)
    puts 'Person created successfully'
  end
end