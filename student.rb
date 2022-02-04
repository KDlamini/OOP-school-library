require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(id:, age:, name: 'Unknown', parent_permission: true, classroom: nil)
    super(id: id, age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
  end
end
