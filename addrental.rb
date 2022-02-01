require './rental'

module CreateRental
  def add_rental
    puts "Select a book from the following list by number:\n"

    books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end

    book_index = gets.chomp

    puts "\nSelect a person from the following list by number (not id):"

    users.each_with_index do |user, index|
      puts "#{index}) Name: #{user.name}, ID: #{user.id}, Age: #{user.age}"
    end

    user_index = gets.chomp

    if !books[book_index.to_i] || !users[user_index.to_i]
      clear
      puts "The user/book selected does not exist.\n"
      continue?
    else
      print "\nDate: "
      date = gets.chomp

      update_rentals(Rental.new(users[user_index.to_i], books[book_index.to_i], date))
      response('Rental')
    end
  end
end
