require './book'

module CreateBook
  def add_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    update_books(Book.new(title, author))
    response('Book ')
  end
end
