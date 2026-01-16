=begin
Assignment 6: Employee Management System
Build a simple Employee Management System using Ruby that demonstrates:
●​ Inheritance
●​ Modules
●​ Basic Ruby concepts
Module: LoggerModule
Create a module LoggerModule with:
●​ Method: log(message)
●​ Output format: [LOG] <message>
Base Class: Employee
Create a class Employee with:
Attributes
●​ name
●​ employee_id
●​ base_salary
Methods
●​ display_details
●​ calculate_salary
●​ log_employee (uses LoggerModule)
Default calculate_salary should return base_salary.
Inherited Classes
a) Developer (inherits from Employee)
●​ Extra attribute: bonus
●​ Override calculate_salary
○​ Total salary = base_salary + bonusb) Manager (inherits from Employee)
●​ Extra attribute: incentive
●​ Override calculate_salary
○​ Total salary = base_salary + incentive
Use super where applicable.
Employee Storage
●​ Store multiple employee objects in an array
●​ Display employee details using iteration
Program Flow
1.​ Create at least:
○​ 1 Developer
○​ 1 Manager
2.​ Display details of each employee
3.​ Print calculated salary
4.​ Log important actions
=end

require_relative "developer"
require_relative "manager"
require_relative "intern"

employees = []

def valid_integer?(input)
  input.match?(/\A\d+\z/)
end

def get_positive_integer(prompt, field_name)
  print prompt
  input = gets.chomp.strip

  raise ArgumentError, "Invalid #{field_name}" unless valid_integer?(input)

  value = input.to_i
  raise ArgumentError, "#{field_name} must be greater than 0" if value <= 0

  value
end

def get_name
  print "Name: "
  name = gets.chomp.strip

  raise ArgumentError, "Name cannot be empty" if name.empty?
  raise ArgumentError, "Name must contain alphabets" unless name.match?(/[A-Za-z]/)

  name
end

def find_employee(employees, id)
  employees.find { |emp| emp.employee_id == id }
end

loop do
  puts "\nEmployee Management System"
  puts "1. Add Developer"
  puts "2. Add Manager"
  puts "3. Add Intern"
  puts "4. View All Employees"
  puts "5. Search Employee by ID"
  puts "6. Update Employee Salary"
  puts "7. Remove Employee"
  puts "8. Employee Count by Role"
  puts "9. Exit"

  print "Enter choice: "
  choice = gets.chomp.strip

  unless valid_integer?(choice)
    puts "Invalid menu choice."
    next
  end

  begin
    case choice.to_i
    when 1
      name = get_name
      id = get_positive_integer("ID: ", "ID")

      raise ArgumentError, "Employee ID already exists" if find_employee(employees, id)

      salary = get_positive_integer("Base Salary: ", "Base Salary")

      print "Bonus: "
      bonus_input = gets.chomp.strip
      raise ArgumentError, "Invalid Bonus" unless valid_integer?(bonus_input)
      bonus = bonus_input.to_i

      emp = Developer.new(name, id, salary, bonus)
      emp.log_employee("Employee created: #{name}")
      employees << emp

    when 2
      name = get_name
      id = get_positive_integer("ID: ", "ID")

      raise ArgumentError, "Employee ID already exists" if find_employee(employees, id)

      salary = get_positive_integer("Base Salary: ", "Base Salary")

      print "Incentive: "
      inc_input = gets.chomp.strip
      raise ArgumentError, "Invalid Incentive" unless valid_integer?(inc_input)
      incentive = inc_input.to_i

      emp = Manager.new(name, id, salary, incentive)
      emp.log_employee("Employee created: #{name}")
      employees << emp

    when 3
      name = get_name
      id = get_positive_integer("ID: ", "ID")

      raise ArgumentError, "Employee ID already exists" if find_employee(employees, id)

      stipend = get_positive_integer("Stipend: ", "Stipend")

      emp = Intern.new(name, id, stipend)
      emp.log_employee("Employee created: #{name}")
      employees << emp

    when 4
      if employees.empty?
        puts "No employees available."
      else
        employees.each do |emp|
          emp.display_details
          puts "Salary: #{emp.calculate_salary}"
          puts "-" * 30
        end
      end

    when 5
      id = get_positive_integer("Enter employee ID: ", "ID")
      emp = find_employee(employees, id)
      emp ? emp.display_details : puts("Employee not found.")

    when 6
      id = get_positive_integer("Enter employee ID: ", "ID")
      emp = find_employee(employees, id)

      if emp
        salary = get_positive_integer("Enter new base salary: ", "Salary")
        emp.base_salary = salary
        emp.log_employee("Salary updated for #{emp.name}")
      else
        puts "Employee not found."
      end

    when 7
      id = get_positive_integer("Enter employee ID: ", "ID")
      employees.reject! { |emp| emp.employee_id == id }
      puts "Employee removed if ID existed."

    when 8
      counts = Hash.new(0)
      employees.each { |emp| counts[emp.class] += 1 }

      puts "Developers: #{counts[Developer]}"
      puts "Managers: #{counts[Manager]}"
      puts "Interns: #{counts[Intern]}"

    when 9
      puts "Exiting system."
      break

    else
      puts "Invalid option."
    end

  rescue StandardError => e
    puts "Error: #{e.message}"
  end
end

=begin
aryan@aryan-LOQ-15IRX9:~/Desktop/Training/7. ROR/ruby/asg6_employee_management$ ruby main.rb

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 2
Name: Nick Fury
ID: 1
Base Salary: 100000
Incentive: 10000
[LOG] 16:06:09 - Employee created: Nick Fury

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 2
Name: Iron Man
ID: 2
Base Salary: 50000
Incentive: 5000
[LOG] 16:06:25 - Employee created: Iron Man

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 2
Name: Captain America
ID: 3
Base Salary: 50000
Incentive: 5000
[LOG] 16:06:42 - Employee created: Captain America

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 2
Name: Thor
ID: 4
Base Salary: 50000
Incentive: 5000
[LOG] 16:07:04 - Employee created: Thor

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 2
Name: Doctor Strange 
ID: 5
Base Salary: 50000
Incentive: 5000
[LOG] 16:07:24 - Employee created: Doctor Strange

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 4
Name: Nick Fury
ID: 1
Role: Employee
Role: Manager
Incentive: 10000
Salary: 110000
------------------------------
Name: Iron Man
ID: 2
Role: Employee
Role: Manager
Incentive: 5000
Salary: 55000
------------------------------
Name: Captain America
ID: 3
Role: Employee
Role: Manager
Incentive: 5000
Salary: 55000
------------------------------
Name: Thor
ID: 4
Role: Employee
Role: Manager
Incentive: 5000
Salary: 55000
------------------------------
Name: Doctor Strange
ID: 5
Role: Employee
Role: Manager
Incentive: 5000
Salary: 55000
------------------------------

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 5
Enter employee ID: 1
Name: Nick Fury
ID: 1
Role: Employee
Role: Manager
Incentive: 10000

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 6
Enter employee ID: 1
Enter new base salary: 200000
[LOG] 16:07:53 - Salary updated for Nick Fury

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 7
Enter employee ID: 5
Employee removed if ID existed.

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 7
Enter employee ID: 5
Employee removed if ID existed.

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 3
Name: Spider Man
ID: 5
Stipend: 10000
[LOG] 16:08:24 - Employee created: Spider Man

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 8
Developers: 0
Managers: 4
Interns: 1

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 9
Exiting system.

aryan@aryan-LOQ-15IRX9:~/Desktop/Training/7. ROR/ruby/asg6_employee_management$ ruby main.rb

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 1
Name: 1
Error: Name must contain alphabets

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 1
Name: a
ID: a
Error: Invalid ID

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 1
Name: a
ID: 1
Base Salary: 0
Error: Base Salary must be greater than 0

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 1
Name: a
ID: 1
Base Salary: -1
Error: Invalid Base Salary

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 1
Name: a
ID: 1
Base Salary: 1
Bonus: 0
[LOG] 16:10:14 - Employee created: a

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 1
Name: a
ID: 1
Error: Employee ID already exists

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 1
Name: a
ID: 2
Base Salary: 10
Bonus: 2
[LOG] 16:10:35 - Employee created: a

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 3
Name: b
ID: 8
Stipend: 5
[LOG] 16:10:43 - Employee created: b

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 4
Name: a
ID: 1
Role: Employee
Role: Developer
Bonus: 0
Salary: 1
------------------------------
Name: a
ID: 2
Role: Employee
Role: Developer
Bonus: 2
Salary: 12
------------------------------
Name: b
ID: 8
Role: Employee
Role: Intern
Salary: 5
------------------------------

Employee Management System
1. Add Developer
2. Add Manager
3. Add Intern
4. View All Employees
5. Search Employee by ID
6. Update Employee Salary
7. Remove Employee
8. Employee Count by Role
9. Exit
Enter choice: 
=end