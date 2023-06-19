# BANK TECH TEST - Class Design Recipe

## 1. Describing the Problem

```
As a user
So that I can add money to my account
I would like to be able to make a deposit 

As a user
So that I can withdraw money from my account
I would like to be able to withdraw a specified amount 

As a user
So that I can keep track of my transactions
I would like to be able to print my bank statement showing deposits, withdrawls and dates

As a user
So that I know how much money I have
I would like my bank statement to show my balance after each transaction
```

## 2. Designing the Class Interface

```ruby
# EXAMPLE

class Account 
  def initialize(transaction_class) 
    # would begin with 0 balance
    # would begin with 0 transactions
  end

  def deposit(amount, date)
    # returns nothing, would take the amount as one parameter and add this to the account balance
    # second parameter would be date, defaulting at today's date unless a specific date is given
  end

  def withdrawal(amount, date)
    # returns nothing, would take the amount as one parameter and add this to the account balance
    # second parameter would be date, defaulting at today's date unless a specific date is given
  end

  def show_statement
    # returns the account statement with dates of deposits and withdrawls and a ongoing balance
  end

  private

  def balance
    # go through transactions and calculate balance
  end
end
```

## 3. Examples as Tests

```ruby
# EXAMPLE

# 1 - it makes a deposit
account = Account.new
account.deposit(1000, "10/01/2023")
account.balance # => 1000
account.show_statement # => date || credit  || debit || balance
                   # 10/01/2023  || 1000.00 ||       || 1000.00


# 2 - it makes a withdrawl
account = Account.new
account.withdrawal(500, "14/01/2023")
account.balance # => -500
account.show_statement # => date || credit  || debit  || balance
                   # 14/01/2023  ||         || 500.00 || -500.00


# 3 - it makes 2 deposits and has a cumulative total balance
account = Account.new
account.deposit(1000, "10/01/2023")
account.deposit(2000, "13/01/2023")
account.balance # => 3000

account.show_statement # => date || credit  || debit  || balance
                   # 13/01/2023  || 2000.00 ||        || 3000.00
                   # 10/01/2023  || 1000.00 ||        || 1000.00

# 4 - it makes 2 deposits and a withdrawal and the balance goes up then down 
account = Account.new
account.deposit(1000, "10/01/2023")
account.deposit(2000, "13/01/2023")
account.withdrawal(500, "14/01/2023")
account.balance # => 2500

account.show_statement # => date || credit  || debit  || balance
                   # 14/01/2023  ||         || 500.00 || 2500.00
                   # 13/01/2023  || 2000.00 ||        || 3000.00
                   # 10/01/2023  || 1000.00 ||        || 1000.00
```
