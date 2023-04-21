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
end
