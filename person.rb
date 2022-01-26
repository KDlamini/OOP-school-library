class Person
    attr_reader :id
    attr_accessor :name, :age

    def initialize(name = "Unknown", age, parent_permission: true)
        @id = Random.rand(1000..2000)
        @name
        @age
        @parent_permission = parent_permission
    end

    def can_use_services?
        return true if @parent_permission || is_of_age?
    end

    private

    def is_of_age?
        @age >= 18

        false
    end
end
