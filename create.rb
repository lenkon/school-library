require './list'
require './book'
require './rental'
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
    puts
    puts 'Select a book from the following list by number'
    List.list_books(books)
    book_option = gets.chomp.to_i

    while book_option.negative? || book_option >= books.length
      print "Enter a number between 0 - #{books.length - 1}: "
      book_option = gets.chomp.to_i
    end

    book = books[book_option]

    puts
    puts 'Select a person from the following list by number (not id)'
    List.list_people(people)
    person_option = gets.chomp.to_i
    while person_option.negative? || person_option >= people.length
      print "Enter a number between 0 - #{people.length - 1}: "
      person_option = gets.chomp.to_i
    end

    person = people[person_option]
    puts
    print 'Date (YYYY/MM/DD): '
    date = gets.chomp.strip
    person.add_rental(date, book)
    puts 'Rental created successfully'
  end
end
