require './person'

class Student < Person
    attr_reader :classroom

    def initialize(name, age, parent_permission, classroom)
        super(name, age, parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end

Sally = Student.new("Sally", 30, false,"English")

p Sally