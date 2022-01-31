require './student'
require './teacher'
require './book'
require './rental'
require './module'

class App
  include Helpers

  @@books = []
  @@users = []
  @@rentals = []

  def run
    clear
    puts 'Welcome to The School Library'
    prompt_user
  end

  def prompt_user
    options
    input = gets.chomp

    if input.to_i.between?(1, 6)
      clear
      selection(input)
    elsif input == '0'
      exit
    else
      invalid_prompt
      prompt_user
    end
  end

  def options
    puts "\nPlease select a number to choose an option:"
    puts '1 - Create a user'
    puts '2 - Create a book'
    puts '3 - Create a rental'
    puts '4 - List all books'
    puts '5 - List all people'
    puts '6 - List all rentals by user id'
    puts '0 - Exit'
  end

  def selection(input)
    case input
    when '1'
      CreateUser.new.add_user
    when '2'
      CreateBook.new.add_book
    when '3'
      CreateRental.new.add_rental
    when '4'
      list_all_books
    when '5'
      list_all_people
    when '6'
      list_all_rental_by_id
    end
  end

  def list_all_books
    @@books.each do |book|
      puts "Title: #{book.title} | Author: #{book.author}"
    end
    puts "\n"
    continue?
  end

  def list_all_people
    @@users.each do |user|
      puts "[#{user.class}] Name: #{user.name} | ID: #{user.id} | Age: #{user.age}"
    end
    puts "\n"
    continue?
  end

  def list_all_rental_by_id
    print 'ID of person: '
    user_id = gets.chomp

    puts 'Rentals:'
    @@rentals.each do |rental|
      if rental.person.id.to_s == user_id
        puts "[#{rental.person.class}] Name: #{rental.person.name} | Date: #{rental.date} | Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end

    puts "\n"
    continue?
  end
end

class CreateUser
  include Helpers

  def add_user
    puts "\nPlease select a number to choose an option:"
    puts '1 - Create a student'
    puts '2 - Create a teacher'
    puts '0 - Exit'
    user = gets.chomp

    case user
    when '1'
      clear
      CreateStudent.new.add_student
    when '2'
      clear
      CreateTeacher.new.add_teacher
    when '0'
      exit
    else
      invalid_prompt
      add_user
    end
  end
end

class CreateStudent < App
  def add_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp

    parent_permission = permission.downcase == 'y' || permission.downcase == 'yes' || permission == ''

    @@users << Student.new(age: age.to_i, name: name, parent_permission: parent_permission)
    response('Student')
  end
end

class CreateTeacher < App
  def add_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @@users << Teacher.new(specialization: specialization, age: age.to_i, name: name)
    response('Teacher')
  end
end

class CreateBook < App
  def add_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @@books << Book.new(title, author)
    response('Book ')
  end
end

class CreateRental < App
    def add_rental
    puts "Select a book from the following list by number:\n"

    @@books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end

    book_index = gets.chomp

    puts "\nSelect a person from the following list by number (not id):"

    @@users.each_with_index do |user, index|
      puts "#{index}) Name: #{user.name}, ID: #{user.id}, Age: #{user.age}"
    end

    user_index = gets.chomp

    if !@@books[book_index.to_i] || !@@users[user_index.to_i]
      clear
      puts "The user/book selected does not exist.\n"
      continue?
    else
      print "\nDate: "
      date = gets.chomp

      @@rentals << Rental.new(@@users[user_index.to_i], @@books[book_index.to_i], date)
      response('Rental')
    end
  end
end

def load
  app = App.new
  app.run
end

load
