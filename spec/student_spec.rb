require_relative '../student'

describe Student do
  context 'It should add a student' do
    student = Student.new(id: 1827, classroom: 'new classroom', age: 23, name: 'hamid', parent_permission: true)

    it 'student should be an instance of class Student' do
      expect(student).to be_an_instance_of(Student)
    end

    it 'should add a classroom' do
      expect(student.add_classroom('check room')).to eq('check room')
    end

    it 'expects method play hooky to return ¯\\(ツ)/¯' do
      expect(student.play_hooky).to eql('¯\\(ツ)/¯')
    end

    it 'creates a student with permission' do
      expect(student.can_use_services?).to eq true
    end
  end
end
