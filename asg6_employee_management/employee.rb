require_relative "logger_module"

class Employee
  include LoggerModule

  attr_reader :name, :employee_id
  attr_accessor :base_salary

  def initialize(name, employee_id, base_salary)
    name = name.strip

    raise ArgumentError, "Name cannot be empty" if name.empty?
    raise ArgumentError, "Name must contain alphabets" unless name.match?(/[A-Za-z]/)
    raise ArgumentError, "Employee ID must be greater than 0" if employee_id <= 0
    raise ArgumentError, "Salary cannot be negative" if base_salary < 0

    @name = name
    @employee_id = employee_id
    @base_salary = base_salary
  end

  def log_employee(message)
    log(message)
  end

  def display_details
    puts "Name: #{@name}"
    puts "ID: #{@employee_id}"
    puts "Role: Employee"
  end

  def calculate_salary
    @base_salary
  end
end
