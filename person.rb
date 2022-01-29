require './corrector'

class Person
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1000..2000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    return true if @parent_permission || of_age?
  end

  def validate_name
    @corrector.correct_name(@name)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
