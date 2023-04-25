require './helper'

class List
  def self.list_books(books)
    books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def self.list_people(people)
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def self.list_rentals(people)
    print 'ID of person: '
    person_id = gets.chomp.to_i
    person = Getter.get(people, person_id)
    return unless person

    puts 'Rentals:'
    person.rentals.each do |rental|
      puts "Date: #{rental.date} Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
