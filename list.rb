require './preservedata'
module Listers
  include PreserveData

  def list_all_people
    fetch_saved_data('users').each do |user|
      puts "[#{user['instance']}] Name: #{user['name']} | ID: #{user['id']} | Age: #{user['age']}"
    end
    puts "\n"
    continue?
  end

  def list_all_books
    fetch_saved_data('books').each do |book|
      puts "Title: #{book['title']} | Author: #{book['author']}"
    end
    puts "\n"
    continue?
  end

  def list_all_rental_by_id
    print 'ID of person: '
    user_id = gets.chomp

    puts 'Rentals:'
    rentals.each do |rental|
      if rental.person.id.to_s == user_id
        puts "[#{rental.person.class}] Name: #{rental.person.name}
        | Date: #{rental.date} | Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end

    puts "\n"
    continue?
  end
end
