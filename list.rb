module Listers
  def list_all_people
    users.each do |user|
      puts "[#{user.class}] Name: #{user.name} | ID: #{user.id} | Age: #{user.age}"
    end
    puts "\n"
    continue?
  end
  
  def list_all_books
    books.each do |book|
      puts "Title: #{book.title} | Author: #{book.author}"
    end
    puts "\n"
    continue?
  end
end
