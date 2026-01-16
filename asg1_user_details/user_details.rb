=begin
Assignment 1: Print User Details
Task
●​ Store your name, age, and city in variables
●​ Print them in a readable sentence
Example Output
My name is Rahul, I am 22 years old and I live in Pune.
=end

print "Enter your name: "
name = gets.chomp

print "Enter your age : "
age = gets.chomp.to_i

print "Enter your city : "
city = gets.chomp

if age <= 0
  puts "Invalid age"
else
  puts "Hey, myself #{name}, I am #{age} years old and live #{city}"

end

=begin
aryan@aryan-LOQ-15IRX9:~/Desktop/Training/7. ROR/Ruby/asg1_user_details$ ruby user_details.rb
Enter your name: Aryan
Enter your age : 22
Enter your city : Pune
Hey, myself Aryan, I am 22 years old and live Pune

aryan@aryan-LOQ-15IRX9:~/Desktop/Training/7. ROR/Ruby/asg1_user_details$ 
=end