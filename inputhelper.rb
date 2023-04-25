require './list'

class InputHelper
  def self.title
    print 'Title: '
    gets.chomp.strip.capitalize
  end

  def self.author
    print 'Author: '
    gets.chomp.strip.capitalize
  end

  def self.get_book(books)
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

  def self.get_person(people)
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

  def self.get_date
    puts
    print 'Date (YYYY/MM/DD): '
    date = gets.chomp.strip
  end
end
