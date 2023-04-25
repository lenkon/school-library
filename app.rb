require './create'
require './book'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def diplay_menu
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def execute_option(option)
    case option
    when 1
      List.list_books(@books)
    when 2
      List.list_people(@people)
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      List.list_rentals(@people)
    end
  end

  def create_person
    puts
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.strip.to_i
    case option
    when 1
      Create.create_student(@people)
    when 2
      Create.create_teacher(@people)
    end
  end

  def create_book
    puts
    print 'Title: '
    title = gets.chomp.strip.capitalize
    print 'Author: '
    author = gets.chomp.strip.capitalize
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts
    puts 'Select a book from the following list by number'
    list_books
    book_option = gets.chomp.to_i

    while book_option.negative? || book_option >= @books.length
      print "Enter a number between 0 - #{@books.length - 1}: "
      book_option = gets.chomp.to_i
    end
    book = @books[book_option]

    puts
    puts 'Select a person from the following list by number (not id)'
    list_people
    person_option = gets.chomp.to_i

    while person_option.negative? || person_option >= @people.length
      print "Enter a number between 0 - #{@people.length - 1}: "
      person_option = gets.chomp.to_i
    end

    person = @people[person_option]

    puts
    print 'Date (YYYY/MM/DD): '
    date = gets.chomp.strip
    person.add_rental(date, book)
    puts 'Rental created successfully'
  end
end
