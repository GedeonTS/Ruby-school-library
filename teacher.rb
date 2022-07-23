require_relative './person'

class Teacher < Person
  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
    @age = age
    @name = name
  end

  def can_use_service?
    true
  end
end
