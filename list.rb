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
end
