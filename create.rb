require './book'
require './student'
require './teacher'
require './inputhelper'

class Create
  def self.create_person(people)
    option = InputHelper.fetch_person_type
    case option
    when 1
      create_student(people)
    when 2
      create_teacher(people)
    end
  end

  def self.create_student(people)
    age = InputHelper.fetch_student_age

    name = InputHelper.fetch_name

    permission = InputHelper.fetch_permission

    people << Student.new(age, nil, name, parent_permission: permission)
    puts 'Person created successfully'
    puts
  end

  def self.create_teacher(people)
    age = InputHelper.fetch_teacher_age

    name = InputHelper.fetch_name

    specialization = InputHelper.fetch_specialization

    people << Teacher.new(age, specialization, name)
    puts 'Person created successfully'
  end

  def self.create_book(books)
    title = InputHelper.title

    author = InputHelper.author

    books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def self.create_rental(people, books)
    book = InputHelper.fetch_book(books)

    person = InputHelper.fetch_person(people)

    date = InputHelper.fetch_date

    person.add_rental(date, book)
    puts 'Rental created successfully'
  end
end
