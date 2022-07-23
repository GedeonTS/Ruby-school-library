require_relative 'person'

class Student < Person
  attr_accessor :classroom, :name, :age
  attr_reader :id

  def initialize(age, _parent_permission, name = 'Unknown', classroom = 'Unknown')
    super(age, name, parent_permission: true)
    @id = Random.rand(1..9999)
    @classroom = classroom
    @name = name
    @age = age
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom=(classroom)
    @classroom = classroom.label
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
