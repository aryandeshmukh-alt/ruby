# Directions

Each code file contains commented problem statement, actual code, followed by commented output, which can be found in corresponding repository.

## Assignment 1: Print User Details

### What was asked to be done

The objective of this assignment was to store a user’s name, age, and city in variables and then print them in a single readable sentence using Ruby.

### What was implemented

The required functionality was fully implemented by storing the user’s name, age, and city and displaying them in a formatted sentence. In addition to the basic requirement, the program was extended to take input from the user at runtime instead of using hardcoded values. A simple validation was also added to ensure that the entered age is a valid positive number.

### How the solution works

The program starts by asking the user to enter their name, age, and city using standard input. The input is read using gets.chomp so that extra newline characters are removed. The age input is converted into an integer to allow validation. A conditional check is performed to verify that the age entered is greater than zero. If the age is invalid, an error message is displayed. Otherwise, the program prints a readable sentence containing the user’s details.

### Concepts and functions used

Basic Ruby variables were used to store user data. The gets.chomp method was used for input handling, and to\_i was used to convert the age from a string to an integer. String interpolation was used to generate clean and readable output. An if-else conditional statement was used to implement simple validation logic.

## Assignment 2: Count Word Frequency

### What was asked to be done

The goal of this assignment was to take a sentence as input and count how many times each word appears in it. The final output was expected to be a hash where each word is a key and its frequency is the corresponding value.

### What was implemented

The required functionality was implemented by reading a sentence and calculating the frequency of each word using a hash. In addition to the basic requirement, the program was enhanced to handle real-world input more accurately. Punctuation marks were removed so they do not get counted as part of words. The sentence was also converted to lowercase to ensure that words with different cases are treated as the same word. Extra handling was added for multiple spaces and empty input.

### How the solution works

The program first takes a sentence from the user as input. The input is cleaned by converting it to lowercase and removing all characters except letters and spaces using a regular expression. This ensures punctuation and numbers do not affect the word count. After cleaning, the sentence is split into individual words. A hash with a default value of zero is used to store word frequencies. The program iterates through each word and increments its count in the hash. If the user enters an empty or invalid sentence, the program displays a message and exits gracefully.

### Concepts and functions used

Strings were processed using methods such as downcase, gsub, strip, and split. A regular expression was used to remove punctuation and unwanted characters. A hash with a default value was used to store and update word counts efficiently. Iteration was done using an each loop, and basic conditional logic was used to handle empty input cases.

## Assignment 3: Classes and Objects – Bank Account

### What was asked to be done

The objective of this assignment was to create a BankAccount class in Ruby with attributes for account holder and balance, along with methods to deposit money, withdraw money, and display the current balance. The assignment was intended to demonstrate basic object-oriented programming concepts.

### What was implemented

The core requirements were implemented by creating a BankAccount class that stores account details and performs deposit, withdrawal, and balance display operations. In addition to the basic functionality, the program was extended into a menu-driven application that allows the user to perform multiple transactions in a single run. Input validation was added to prevent invalid operations such as negative deposits, invalid withdrawals, and incorrect menu choices. A transaction history feature was also included to track all deposits and withdrawals.

### How the solution works

The program begins by asking the user for the account holder’s name and an initial balance. After creating a bank account object, the program displays a menu that allows the user to choose between deposit, withdrawal, balance display, transaction history, or exit. User input is validated before processing each operation. Deposits and withdrawals update the account balance and are stored in a transaction history array. The program runs in a loop until the user chooses to exit, at which point a summary of the account is displayed.

### Concepts and functions used

The solution uses Ruby classes and objects to model a real-world bank account. Instance variables are used to store account data, and instance methods handle account operations. Control structures such as loops, conditionals, and case statements are used to implement the menu system. Arrays are used to store transaction history, and basic input validation is performed using string methods and conditional checks.
  
## Assignment 4: Ruby Style Fix

### What was asked to be done

The purpose of this assignment was to take a given piece of poorly written Ruby code and rewrite it by following proper Ruby style guidelines. The focus of the task was on improving readability, naming conventions, and overall code quality rather than adding new functionality.

### What was implemented

The original code was rewritten using standard Ruby naming conventions. The class name was corrected to follow CamelCase, method names were converted to snake\_case, and instance variable names were simplified for clarity. Indentation and formatting were corrected to improve readability. String concatenation was replaced with string interpolation to follow idiomatic Ruby practices. In addition to these changes, small stylistic improvements such as using attribute readers and basic validation were added without altering the original behavior of the program.

### How the solution works

The corrected program defines a BankAccount class with a clean constructor that initializes the account holder’s name and balance. Proper naming and formatting make the code easier to read and understand. The balance display method outputs the account information using string interpolation. A simple validation ensures that an invalid balance value is not accepted during object creation.

### Concepts and functions used

This assignment focuses on Ruby coding standards rather than logic complexity. It demonstrates proper class and method naming, use of instance variables, string interpolation, attribute readers, and clean formatting. A multiline comment is used to describe the purpose and approach of the solution.

## Assignment 5: Thoeretical Conceptual Questions

Refer the txt file in the corresponding repository

## Assignment 6: Employee Management System

### What Was Asked in the Assignment

The assignment required building a simple system with a base Employee class and derived classes like Developer and Manager. A Logger module had to be created to log important actions. The program needed to store multiple employees, display their details using iteration, calculate salaries based on role, and log employee creation. Optional bonus tasks included adding new roles, validations, and exception handling.

### What Was Implemented

All required features were implemented as specified. In addition, several extra features were added to make the system more practical. An Intern role was added as an extra employee type. The program was made menu-driven so the user can interactively add, view, search, update, and remove employees. Strong input validation was added to handle invalid names, non-numeric values, negative salaries, and duplicate employee IDs. Exception handling was used to prevent the program from crashing on invalid input. Logging was enhanced by adding timestamps to log messages.

### How the System Works

The program starts execution from the main.rb file. The user is shown a menu with different options such as adding an employee, viewing all employees, searching by ID, updating salary, and removing an employee. Based on the user’s choice, the corresponding logic is executed. All employee objects are stored in an array, which allows iteration and searching. Logging happens whenever important actions such as employee creation or salary updates occur.

### Design and Structure

The project is divided into multiple files to maintain clarity and separation of concerns. The LoggerModule is responsible only for logging. The Employee class acts as a base class and contains common attributes and methods. Developer, Manager, and Intern inherit from Employee and override the salary calculation where required. The main.rb file handles user input, menu flow, validation, and interaction between objects.

### Concepts and Ruby Features Used

This project uses Ruby modules, class inheritance, method overriding, and the super keyword. It also uses arrays for object storage, hashes for counting employees by role, exception handling with begin and rescue, regular expressions for input validation, and basic input/output operations.

### Extra Improvements and Edge Case Handling

Several real-world edge cases were handled. Names that are empty or contain only numbers are rejected. Employee IDs must be positive integers and cannot be duplicated. Salary-related fields accept only non-negative numeric values. Invalid menu choices are handled gracefully. Clear and meaningful error messages are shown to the user instead of allowing silent failures.