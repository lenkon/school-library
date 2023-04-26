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

  def self.load_people
    people = []
    create_directory
    File.write('./store/people.json', []) unless File.exist?('./store/people.json')
    records = JSON.parse(File.read('./store/people.json'))
    records.each do |record|
      person = if record['type'] == 'Student'
                 Student.new(record['age'],
                             nil,
                             record['name'],
                             parent_permission: record['parent_permission'])
               else
                 Teacher.new(record['age'], '', record['name'])
               end
      person.id = record['id']
      people << person
    end
    people
  end
end
