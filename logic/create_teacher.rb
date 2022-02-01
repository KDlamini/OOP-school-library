require './main'
require './teacher'

class CreateTeacher < App
  def add_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @@users << Teacher.new(specialization: specialization, age: age.to_i, name: name)
    response('Teacher')
  end
end
