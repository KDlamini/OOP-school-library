require './person'

class Teacher < Person
  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

sally = Teacher.new('Sally', 30, 'Math')

p sally.name
p sally.age