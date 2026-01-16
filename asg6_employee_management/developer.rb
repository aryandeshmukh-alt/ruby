require_relative "employee"

class Developer < Employee
  attr_accessor :bonus

  def initialize(name, employee_id, base_salary, bonus)
    raise ArgumentError, "Bonus cannot be negative" if bonus < 0
    super(name, employee_id, base_salary)
    @bonus = bonus
  end

  def calculate_salary
    super + @bonus
  end

  def display_details
    super
    puts "Role: Developer"
    puts "Bonus: #{@bonus}"
  end
end
