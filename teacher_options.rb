require './teacher'
require './app'

module TeacherOptions
  include App

  def add_teacher(people_list)
    puts 'In order to create a new Teacher, we need some information first...'
    puts 'Name?'
    teach_name = gets.chomp
    puts 'Age?'
    teach_age = gets.chomp
    puts 'Specialization?'
    teach_spec = gets.chomp
    add_person_list(people_list, Teacher.new(teach_spec, teach_age, teach_name))
    puts '---------------------------------------------'
    puts 'The Teacher was created successfully!'
    puts '---------------------------------------------'
  end
end
