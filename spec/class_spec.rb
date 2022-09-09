require './classroom'

describe Classroom do
  context 'When testing Classroom class' do
    before :each do
      @classroom = Classroom.new('Math')
      @student = Student.new('', 15, 'Tom')
    end

    it 'the classroom should add a student to his list' do
      @classroom.add_student(@student)
      expect(@classroom.students[0]).to eq @student
    end

    it 'the student should be assigned to a classroom' do
      @student.classroom = @classroom
      expect(@student.classroom.label).to eq 'Math'
    end

    it 'The classroom should have a student after get assigned' do
      @student.classroom = @classroom
      expect(@classroom.students[0].name).to eq 'Tom'
    end
  end
end
