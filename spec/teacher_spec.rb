require './teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Teacher', 20, 'Olaoluwa')
  end

  it 'Should not return a new teacher object' do
    expect(@teacher.class).to eql Teacher
  end
end
