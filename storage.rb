require 'json'

class Storage
  def self.create_directory
    return if File.directory?('./store')

    FileUtils.mkdir_p('./store')
  end

  def self.save_all(people, books, rentals)
    create_directory
    save_people(people)
    save_books(books)
    save_rentals(rentals)
  end

  def self.save_people(people)
    File.write('./store/people.json', []) unless File.exist?('./store/people.json')
    records = []
    people.each do |person|
      records << {
        id: person.id,
        type: person.class,
        name: person.name,
        age: person.age,
        parent_permission: person.can_use_services?
      }
    end
    File.write('./store/people.json', JSON.generate(records))
  end

  def self.save_books(books)
    File.write('./store/books.json', []) unless File.exist?('./store/books.json')
    records = []
    books.each { |book| records << { title: book.title, author: book.author } }
    File.write('./store/books.json', JSON.generate(records))
  end

  def self.save_rentals(rentals)
    File.write('./store/rentals.json', []) unless File.exist?('./store/rentals.json')
    records = []
    rentals.each do |rental|
      records << {
        date: rental.date,
        id: rental.person.id,
        name: rental.person.name,
        title: rental.book.title,
        author: rental.book.author
      }
    end
    File.write('./store/rentals.json', JSON.generate(records))
  end
end
