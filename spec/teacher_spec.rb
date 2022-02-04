require_relative '../teacher'

describe Teacher do
    context 'It should add a teacher' do
        teacher = Teacher.new(specialization: 'english', age: 27, name: 'tom', parent_permission: true)
    
        it 'teacher should be an instance of class Teacher' do
            expect(teacher).to be_an_instance_of(Teacher)
        end
    
        it 'creates a teacher with permission' do
            expect(teacher.can_use_services?).to eq true
        end

        it 'should validates name, age and specialisation of Teacher' do
            expect(teacher.name).to eql('tom')
            expect(teacher.age).to eql(27)
            expect(teacher.specialization).to eql('english')
        end
    
    end
end