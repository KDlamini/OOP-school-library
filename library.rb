class  Person
    def initialize(name = "Unknown", age, parent_permission = true)
        @id
        @name
        @age
    end

    def id
        @id
    end

    def name
        @name
    end

    def age
        @age
    end

    def name =  (name)
        @name = name
    end

    def age =  (age)
        @age = age
    end

    def can_use_services?
        return true if @parent_permission || @age >= 18
    end

    private

    def is_of_age?
        @age >= 18
    end
end

class Student < Person
    def initialize(name = "Unknown", age, parent_permission = true, classroom)
        super(name, age, parent_permission)
        @classroom = classroom
    end

    def play_hooky
        "¯\(ツ)/¯"
    end
end

class Teacher < Person
    def initialize(name = "Unknown", age, specialization)
        super(name, age)
        @specialization = specialization
    end

    def can_use_services?
        true
    end
end