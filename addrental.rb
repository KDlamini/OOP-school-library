require './rental'
require './preservedata'

module CreateRental
  include PreserveData

  def find_person(id, users)
    users.each { |person| return person if person["id"] == id }
  end

  def find_book(title, books)
    books.each { |book| return book if book["title"] == title }
  end

  def add_rental
    fetched_books = fetch_saved_data('books')
    fetched_users = fetch_saved_data('users')

    puts "Select a book from the following list by number:\n"

    fetched_books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book["title"]}\", Author: #{book["author"]}"
    end

    book_index = gets.chomp

    puts "\nSelect a person from the following list by number (not id):"

    fetched_users.each_with_index do |user, index|
      puts "#{index}) Name: #{user["name"]}, ID: #{user["id"]}, Age: #{user["age"]}"
    end

    user_index = gets.chomp

    if !fetched_books[book_index.to_i] || !fetched_users[user_index.to_i]
      clear
      puts "The user/book selected does not exist.\n"
      continue?
    else
      print "\nDate: "
      date = gets.chomp

      update_rentals(Rental.new(find_person(fetched_users[user_index.to_i]["id"], fetched_books), find_book(fetched_books[book_index.to_i]["title"], fetched_books), date))
      response('Rental')
    end
  end

  # def load_rentals
  #   file = 'rentals.json'
  #   if File.exist? file
  #     JSON.parse(File.read(file)).map do |rental|
  #       date = rental['date']
  #       person = find_person(rental['person'])
  #       book = find_book(rental['book'])
  #       Rental.new(date, book, person)
  #     end
  #   else
  #     []
  #   end
  # end
end
