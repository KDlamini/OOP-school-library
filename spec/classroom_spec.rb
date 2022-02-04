require_relative '../classroom'
require_relative('../student')

describe Classroom do
    context 'It should add a classroom' do
        classroom = Classroom.new('english')
    
        it 'classroom should be an instance of class Classroom' do
            expect(classroom).to be_an_instance_of(Classroom)
        end
    
        it 'should add new student to classroom' do
            classroom.add_student(Student.new(age: 21, classroom: nil, name: 'Hamid', parent_permission: true))
        end
    
    end
end