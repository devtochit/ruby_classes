require './rental'
require './person'
require './student'
require './classroom'
require './book'

p 'Student-Classroom tests'
p  Jesse = Student.new(701, 12, 'Jesse Stud')
p Brenda = Student.new(103, 21, 'Brenda student')
p  Cisco= Student.new(207, 20, 'Cisco kelly')

p class619 = Classroom.new(101)
p class619.students

p jesse.classroom
p class619.add_student(jesse)
p jesse.classroom
p jesse.classroom.label
p class619.students
