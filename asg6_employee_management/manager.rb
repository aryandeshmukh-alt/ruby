require_relative "employee"

class Manager < Employee
  attr_accessor :incentive

  def initialize(name, employee_id, base_salary, incentive)
    raise ArgumentError, "Incentive cannot be negative" if incentive < 0
    super(name, employee_id, base_salary)
    @incentive = incentive
  end

  def calculate_salary
    super + @incentive
  end

  def display_details
    super
    puts "Role: Manager"
    puts "Incentive: #{@incentive}"
  end
end
