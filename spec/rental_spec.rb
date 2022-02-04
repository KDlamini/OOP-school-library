require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Rental do
  context 'should add a book and a person' do
    book = Book.new('48 laws of power', 'Robert Green')
    person = Person.new(id: 1782, age: 15, name: 'hamid', parent_permission: true)
    rental = Rental.new(person, book, '02/02/2022')

    it 'should create a rental for person' do
      expect(person.rentals).to include(rental)
    end

    it 'should create a rental for book' do
      expect(book.rentals).to include(rental)
    end
  end
end