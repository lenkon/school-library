require 'json'
require 'fileutils'

class ReadFile
  def self.create_directory
    return if File.directory?('./store')

    FileUtils.mkdir_p('./store')
  end

  def self.load_books
    books = []
    create_directory
    File.write('./store/books.json', []) unless File.exist?('./store/books.json')
    records = JSON.parse(File.read('./store/books.json'))
    records.each { |record| books << Book.new(record['title'], record['author']) }
    books
  end
end
