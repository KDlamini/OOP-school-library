require './main'
require './student'

class CreateStudent < App
  def add_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp

    parent_permission = permission.downcase == 'y' || permission.downcase == 'yes' || permission == ''

    @@users << Student.new(age: age.to_i, name: name, parent_permission: parent_permission)
    response('Student')
  end
end
