require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @users = []
    @rentals = []
  end

  def run
    clear
    puts "Welcome to The School Library"
    permission
  end

  def prompt_user
    options
    input = gets.chomp

    if input.to_i.between?(1, 6)
      clear
      selection(input)
    elsif input == "0"
      exit
    else
      invalid_prompt
      prompt_user
    end
  end

  def options
    puts "\nPlease select a number to choose an option:"
    puts "1 - Create a user"
    puts "2 - Create a book"
    puts "3 - Create a rental"
    puts "4 - List all books"
    puts "5 - List all people"
    puts "6 - List all rentals by user id"
    puts "0 - Exit"
  end

  def selection(input)
    case input
    when "1"
      create_user
    when "2"
      create_book
    when "3"
      create_rental
    when "4"
      list_all_books
    when "5"
      list_all_people
    when "6"
      list_all_rental_by_id
    end
  end

  def create_user
    puts "\nPlease select a number to choose an option:"
    puts "1 - Create a student"
    puts "2 - Create a teacher"
    puts "0 - Exit"
    user = gets.chomp

    case user
    when '1'
      clear
      create_student
    when '2'
      clear
      create_teacher
    when '0'
      exit
    else
      invalid_prompt
      create_user
    end
  end

  def create_student
    print "Age: "
    age = gets.chomp

    print "Name: "
    name = gets.chomp

    print "Has parent permission? [Y/N]: "
    permission = gets.chomp

    if permission.downcase == "y" || permission.downcase == "yes"
      parent_permission = true
    else
      parent_permission = false
    end

    @users.push(Student.new(age: age.to_i, name: name, parent_permission: parent_permission))
    puts "\nStudent created successfully!"
    continue?
  end

  def continue?
    print "\nDo you wish to continue? [Y/N]: "
    answer = gets.chomp

    if answer.downcase == "y" || answer.downcase == "yes"
      clear
      prompt_user
    else
      exit
    end
  end

  def invalid_prompt
    clear
    puts "Incorrect selection, please try again!"
    sleep 1
  end

  def clear
    print "\e[2J\e[f"
  end

  def exit
    clear
    nil
  end
end

def load
  app = App.new
  app.run
end

load