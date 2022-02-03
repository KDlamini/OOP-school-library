require './student'
require './teacher'

module CreateUser
  def add_user
    puts "\nPlease select a number to choose an option:"
    puts '1 - Create a student'
    puts '2 - Create a teacher'
    puts '0 - Exit'
    user = gets.chomp

    case user
    when '1'
      clear
      add_student
    when '2'
      clear
      add_teacher
    when '0'
      exit
    else
      invalid_prompt
      add_user
    end
  end

  def add_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp

    parent_permission = permission.downcase == 'y' || permission.downcase == 'yes' || permission == ''

    update_users(Student.new(id: Random.rand(1000..2000), age: age.to_i, name: name,
                             parent_permission: parent_permission))
    response('Student')
  end

  def add_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    update_users(Teacher.new(id: Random.rand(1000..2000), specialization: specialization, age: age.to_i, name: name))
    response('Teacher')
  end
end
