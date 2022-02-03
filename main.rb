require './helpers'
require './createuser'
require './list'
require './addbook'
require './addrental'
require './preservedata'

class App
  include Helpers
  include Listers
  include CreateUser
  include CreateBook
  include CreateRental
  include PreserveData

  attr_reader :users, :books, :rentals

  def initialize
    @users = fetch_users
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
      add_rental
    when '4'
      list_all_books
    when '5'
      list_all_people
    when '6'
      list_all_rental_by_id
    end
  end

  def update_users(user)
    @users << user
    save_user(user)
  end

  def update_books(book)
    @books << book
    save_book(book)
  end

  def update_rentals(rental)
    @rentals << rental
    save_rental(rental)
  end
end

def load
  app = App.new
  app.run
end

load
