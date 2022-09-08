require './person'

describe Person do
  context 'When testing the Person class' do
    it 'Should show the person name' do
      person = Person.new(13, 'Tom')
      expect(person.name).to eq 'Tom'
    end
    it 'Should show person age' do
      person = Person.new(13, 'Tom')
      expect(person.age).to eq 13
    end
    it 'Should show true if the person can use the services' do
      person = Person.new(13, 'Tom')
      expect(person.can_use_services?).to eq true
    end
    it 'Should show false if the person can use the services' do
      person = Person.new(13, 'Tom', parent_permission: false)
      expect(person.can_use_services?).to eq false
    end
  end
end