require './book'
require './student'
require './teacher'
require './inputhelper'

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

  def self.create_book(books)
    title = InputHelper.title
    author = InputHelper.author
    books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def self.create_rental(people, books)
    book = InputHelper.get_book(books)

    person = InputHelper.get_person(people)

    date = InputHelper.get_date

    person.add_rental(date, book)
    puts 'Rental created successfully'
  end
end
