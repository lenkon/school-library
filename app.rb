require './book'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def diplay_menu
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
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_rentals
    end
  end

  def run
    input_option = 0
    while input_option != 7
      diplay_menu
      puts
      input_option = gets.chomp.strip.to_i
      execute_option(input_option)
    end
  end

  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def list_people
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def get_person(id)
    @people.each do |person|
      return person if person.id == id
    end
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = get_person(person_id)
    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date: #{rental.date} Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def create_student
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
    @people << Student.new(age, nil, name, parent_permission: permission)
    puts 'Person created successfully'
  end

  def create_teacher
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
    @people << Teacher.new(age, specialization, name)
    puts 'Person created successfully'
  end

  def create_person
    puts
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp.strip.to_i
    case option
    when 1
      create_student
    when 2
      create_teacher
    end
  end  
end
