# require_relative './nameable.rb'

class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Person inherit from Nameable
class Person
  # getters and setters
  attr_reader :id
  attr_accessor :name, :age

  # contructor
  def initialize(age, name, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private :of_age?
end

class BaseDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    super
    @component = nameable
  end

  def correct_name
    @component.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @component.correct_name.capitalize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @component.correct_name.chars.slice(0, 9).join
  end
end
