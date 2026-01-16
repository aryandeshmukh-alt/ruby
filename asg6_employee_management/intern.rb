require_relative "employee"

class Intern < Employee
  def initialize(name, employee_id, stipend)
    super(name, employee_id, stipend)
  end

  def display_details
    super
    puts "Role: Intern"
  end
end
