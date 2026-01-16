=begin
Assignment 4: Ruby Style Fix
Task
●​ Given messy Ruby code
●​ Rewrite it following Ruby style guide
Example (Messy Code)
class bankaccount
def initialize(Name,BAL)
@Name=Name
@BAL=BAL
end
def showBalance
puts @Name+" balance is "+@BAL.to_s
end
end
=end

class BankAccount
  attr_reader :name, :balance

  def initialize(name, balance)
    @name = name
    @balance = balance.to_i

    if @balance < 0
      raise ArgumentError, "Balance cannot be negative"
    end
  end

  def show_balance
    puts "#{name} balance is #{balance}"
    balance
  end
end