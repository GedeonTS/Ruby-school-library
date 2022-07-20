# require_relative './nameable.rb'

class Nameable
    
  def correct_name
      raise NotImplementedError,"#{self.class} has not implemented method '#{__method__}'"
      @name
  end
end

# Person inherit from Nameable
class Person < Nameable
  # getters and setters
  attr_reader :id
  attr_accessor :name, :age
  # contructor
  def initialize(age, name,parent_permission: true)
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

  def correct_name
    @name
  end

  private :of_age?
end
