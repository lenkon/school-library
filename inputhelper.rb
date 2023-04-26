require './list'

class InputHelper
  def self.fetch_person_type
    puts
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    gets.chomp.strip.to_i
  end

  def self.fetch_name
    print 'Name: '
    gets.chomp.strip.capitalize
  end

  def self.fetch_student_age
    puts
    print 'Age: '
    age = gets.chomp.strip.to_i

    while age < 4 || age > 120
      print 'Enter correct age: '
      age = gets.chomp.strip.to_i
    end
    age
  end

  def self.fetch_permission
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.strip.upcase

    case permission
    when 'Y' || 'y'
      permission = true
    when 'N' || 'n'
      permission = false
    end
    permission
  end

  def self.fetch_teacher_age
    puts
    print 'Age: '
    age = gets.chomp.strip.to_i

    while age < 18 || age > 120
      print 'Enter correct age: '
      age = gets.chomp.strip.to_i
    end
    age
  end

  def self.fetch_specialization
    print 'Specialization: '
    gets.chomp.strip
  end

  def self.title
    print 'Title: '
    gets.chomp.strip.capitalize
  end

  def self.author
    print 'Author: '
    gets.chomp.strip.capitalize
  end

  def self.fetch_book(books)
    puts
    puts 'Select a book from the following list by number'
    List.list_books(books)
    book_option = gets.chomp.to_i

    while book_option.negative? || book_option >= books.length
      print "Enter a number between 0 - #{books.length - 1}: "
      book_option = gets.chomp.to_i
    end

    books[book_option]
  end

  def self.fetch_person(people)
    puts
    puts 'Select a person from the following list by number (not id)'
    List.list_people(people)
    person_option = gets.chomp.to_i

    while person_option.negative? || person_option >= people.length
      print "Enter a number between 0 - #{people.length - 1}: "
      person_option = gets.chomp.to_i
    end

    people[person_option]
  end

  def self.fetch_date
    puts
    print 'Date (YYYY/MM/DD): '
    gets.chomp.strip
  end
end
