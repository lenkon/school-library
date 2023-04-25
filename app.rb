require './create'

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
      Create.create_person(@people)
    when 4
      Create.create_book(@books)
    when 5
      Create.create_rental(@people, @books)
    when 6
      List.list_rentals(@people)
    end
  end
end
