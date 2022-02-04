require_relative '../person'

describe Person do
  context 'It should add a person' do
    person = Person.new(id: 1782, age: 23, name: 'hamid', parent_permission: true)

    it 'should be an instance of class Person' do
      expect(person).to be_an_instance_of(Person)
    end

    it 'should validates name of Person' do
      expect(person.validate_name).not_to eq('hamid')
    end

    it 'should check age of Person' do
      expect(person.age).to eq(23)
    end

    it 'should return true if he can use service' do
      expect(person.can_use_services?).to eq true
    end
  end
end
