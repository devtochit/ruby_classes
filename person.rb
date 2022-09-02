require_relative './nameable'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..10_000).to_s
    @rentals = []
  end

  def can_use_service?
    return true if of_age? || @parent_permission # public method

    false
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  private

  def of_age?
    return false if @age < 18

    true if @age >= 18 # private method
  end
end
