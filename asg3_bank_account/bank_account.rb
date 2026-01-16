=begin
Assignment 3: Classes and Objects – Bank Account
Task
Create a BankAccount class.
Attributes
●​ account_holder
●​ balance
Methods
●​ deposit(amount)
●​ withdraw(amount)
●​ show_balance
=end

class BankAccount
  def initialize(account_holder, balance)
    @account_holder = account_holder
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    if amount <= 0
      puts "Deposit amount must be greater than zero."
    else
      @balance += amount
      @transactions << "Deposited #{amount}"
      puts "Deposit successful."
    end
  end

  def withdraw(amount)
    if amount <= 0
      puts "Withdrawal amount must be greater than zero."
    elsif amount > @balance
      puts "Insufficient balance."
    else
      @balance -= amount
      @transactions << "Withdrew #{amount}"
      puts "Withdrawal successful."
    end
  end

  def show_balance
    puts "Account Holder: #{@account_holder}"
    puts "Current Balance: #{@balance}"
  end

  def show_transactions
    if @transactions.empty?
      puts "No transactions yet."
    else
      puts "Transaction History:"
      @transactions.each_with_index do |txn, index|
        puts "#{index + 1}. #{txn}"
      end
    end
  end

  def transaction_count
    @transactions.length
  end
end

print "Enter account holder name: "
name = gets.chomp

if name.strip.empty?
  puts "Account holder name cannot be empty."
  exit
end

print "Enter initial balance: "
initial_balance = gets.chomp

if initial_balance.match?(/[^0-9]/)
  puts "Initial balance must be a number."
  exit
end

initial_balance = initial_balance.to_i

account = BankAccount.new(name, initial_balance)

loop do
  puts "\nChoose an option:"
  puts "1. Deposit"
  puts "2. Withdraw"
  puts "3. Show Balance"
  puts "4. Show Transaction History"
  puts "5. Exit"

  print "Enter choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter deposit amount: "
    amount = gets.chomp
    if amount.match?(/[^0-9]/)
      puts "Please enter a valid number."
    else
      account.deposit(amount.to_i)
    end
  when 2
    print "Enter withdrawal amount: "
    amount = gets.chomp
    if amount.match?(/[^0-9]/)
      puts "Please enter a valid number."
    else
      account.withdraw(amount.to_i)
    end
  when 3
    account.show_balance
  when 4
    account.show_transactions
  when 5
    puts "\nFinal Summary:"
    account.show_balance
    puts "Total Transactions: #{account.transaction_count}"
    puts "Thank you for using the bank system."
    break
  else
    puts "Invalid option. Please choose between 1 and 5."
  end
end

=begin
aryan@aryan-LOQ-15IRX9:~/Desktop/Training/7. ROR/ruby/asg3_bank_account$ ruby bank_account.rb
Enter account holder name: 
Account holder name cannot be empty.
aryan@aryan-LOQ-15IRX9:~/Desktop/Training/7. ROR/ruby/asg3_bank_account$ ruby bank_account.rb
Enter account holder name: Aryan
Enter initial balance: 0

Choose an option:
1. Deposit
2. Withdraw
3. Show Balance
4. Show Transaction History
5. Exit
Enter choice: 1
Enter deposit amount: a
Please enter a valid number.

Choose an option:
1. Deposit
2. Withdraw
3. Show Balance
4. Show Transaction History
5. Exit
Enter choice: 1
Enter deposit amount: 1000
Deposit successful.

Choose an option:
1. Deposit
2. Withdraw
3. Show Balance
4. Show Transaction History
5. Exit
Enter choice: 2
Enter withdrawal amount: 5000
Insufficient balance.

Choose an option:
1. Deposit
2. Withdraw
3. Show Balance
4. Show Transaction History
5. Exit
Enter choice: 2
Enter withdrawal amount: 500
Withdrawal successful.

Choose an option:
1. Deposit
2. Withdraw
3. Show Balance
4. Show Transaction History
5. Exit
Enter choice: 3
Account Holder: Aryan
Current Balance: 500

Choose an option:
1. Deposit
2. Withdraw
3. Show Balance
4. Show Transaction History
5. Exit
Enter choice: 4
Transaction History:
1. Deposited 1000
2. Withdrew 500

Choose an option:
1. Deposit
2. Withdraw
3. Show Balance
4. Show Transaction History
5. Exit
Enter choice: 5

Final Summary:
Account Holder: Aryan
Current Balance: 500
Total Transactions: 2
Thank you for using the bank system.
=end