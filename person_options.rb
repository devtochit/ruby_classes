require './student_options'
require './teacher_options'

module PersonOptions
  include StudentOptions
  include TeacherOptions

  def add_person(persons_list)
    puts 'Do you want to create a Student [1] or a Teacher [2]'
    person_choice = gets.chomp
    case person_choice
    when '1'
      add_student(persons_list)
    when '2'
      add_teacher(persons_list)
    end
  end
end
