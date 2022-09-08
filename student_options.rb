require './student'
require './app'

module StudentOptions
  include App

  def add_student(people_list)
    puts 'In order to create a new student, we need some information first...'
    puts 'Age?'
    age = gets.chomp
    puts 'name?'
    name = gets.chomp
    puts 'Has parent permission? [y/n] (Lowercase)'
    stud_permission = gets.chomp
    add_person_list(people_list, Student.new('none', age, name, parent_permission: permission(stud_permission)))
    puts '---------------------------------------------'
    puts ' The Student was created successfully!'
    puts '---------------------------------------------'
  end

  def permission(permission)
    return true if permission == 'y'

    false
  end
end
