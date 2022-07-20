class Person
  # getters and setters
  attr_reader :id
  attr_accessor :name, :age
  # contructor
  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  

  def of_age?
    @age >= 18
  end

  #  can use service method
  def can_use_service?
    @parent_permission || is_of_age?
  end

  private :of_age?
end
