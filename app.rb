require_relative 'classroom'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'person'

class App
  def initialize
    @my_books = []
    @my_rentals = []
    @people = []
  end

  def my_menu
    puts "\n\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts "7 - Exit\n\n"
    gets.chomp
  end

  def run
    choice = my_menu
    case choice
    when '1'
      action_list_books
    when '2'
      action_list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rental
    else
      puts 'Thanks for using this app ...'
      exit
    end
  end
 
  def list_books
    @my_books.each_with_index do |x, index|
      puts "#{index}) Title: \"#{x.book}\", Author: #{x.author}\n"
    end
  end

  def list_people
    @people.each_with_index do |x, index|
      puts "#{index}) [#{x.class.name}] Name: #{x.name}, ID: #{x.id}, Age: #{x.age}\n"
    end
  end

  def action_list_books
    list_books
    run
  end

  def action_list_people
    list_people
    run
  end


  def my_permission(my_char)
    case my_char
    when 'N'
      false
    when 'Y'
      true
    end
  end


  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    student = Student.new(age, my_permission(permission), name, nil)
    @people.push(student)
  end

  def create_person
    print 'Do you want to create a student or a teacher( 1 for a student or 2 for a teacher)? : '
    person_type = gets.chomp
    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    end
    puts "Person created successfully\n"
    run
  end

  
end
