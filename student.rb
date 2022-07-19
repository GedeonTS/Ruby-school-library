require_relative './person'

# Student  inherits from Person
class Student < Person
  def initialize(classroom, age, parent_permission: true, name: 'Unknown')
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_holky
    "¯\(ツ)/¯"
  end
end
