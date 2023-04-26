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

  def self.save_books(books)
    File.write('./store/books.json', []) unless File.exist?('./store/books.json')
    records = []
    books.each { |book| records << { title: book.title, author: book.author } }
    File.write('./store/books.json', JSON.generate(records))
  end
end
