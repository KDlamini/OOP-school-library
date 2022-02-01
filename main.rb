require './rental'
require './helpers'
require './createuser'
require './list'
require './addbook'

class App
  include Helpers
  include Listers
  include CreateUser
  include CreateBook

  def initialize
    @users = []
    @books = []
    @rentals = []
  end

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
      add_user
    when '2'
      add_book
    when '3'
      CreateRental.new.add_rental
    when '4'
      ListAllBooks.new.list_all_books
    when '5'
      list_all_people
    when '6'
      ListAllRentalById.new.list_all_rental_by_id
    end
  end

  def update_users(user)
    @users << user
  end

  def update_books(book)
    @books << book
  end
  
  def get_users
    @users
  end
end

class ListAllRentalById < App
  def list_all_rental_by_id
    print 'ID of person: '
    user_id = gets.chomp

    puts 'Rentals:'
    @rentals.each do |rental|
      if rental.person.id.to_s == user_id
        puts "[#{rental.person.class}] Name: #{rental.person.name}
        | Date: #{rental.date} | Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end

    puts "\n"
    continue?
  end
end

class ListAllBooks < App
  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title} | Author: #{book.author}"
    end
    puts "\n"
    continue?
  end
end

class CreateRental < App
  def add_rental
    puts "Select a book from the following list by number:\n"

    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end

    book_index = gets.chomp

    puts "\nSelect a person from the following list by number (not id):"

    @users.each_with_index do |user, index|
      puts "#{index}) Name: #{user.name}, ID: #{user.id}, Age: #{user.age}"
    end

    user_index = gets.chomp

    if !@books[book_index.to_i] || !@users[user_index.to_i]
      clear
      puts "The user/book selected does not exist.\n"
      continue?
    else
      print "\nDate: "
      date = gets.chomp

      @rentals << Rental.new(@users[user_index.to_i], @books[book_index.to_i], date)
      response('Rental')
    end
  end
end

def load
  app = App.new
  app.run
end

load
