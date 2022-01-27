class Rental
    attr_accessor :person, :book, :date
  
    def initialize(person, book, date)
      @person = person
      person.rentals.push(self)
      @book = book
      book.rentals.push(self)
      @date = date
    end
  end
  