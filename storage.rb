require 'json'

class Storage
  def self.create_directory
    return if File.directory?('./store')

    FileUtils.mkdir_p('./store')
  end

  def self.save_all(people, books, _rentals)
    create_directory
    save_people(people)
    save_books(books)
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
end
