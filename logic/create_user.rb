require './main'
require './create_student'
require './create_teacher'

class CreateUser < App
  def add_user
    puts "\nPlease select a number to choose an option:"
    puts '1 - Create a student'
    puts '2 - Create a teacher'
    puts '0 - Exit'
    user = gets.chomp

    case user
    when '1'
      clear
      CreateStudent.new.add_student
    when '2'
      clear
      CreateTeacher.new.add_teacher
    when '0'
      exit
    else
      invalid_prompt
      add_user
    end
  end
end
