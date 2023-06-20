require 'date'

class Account
  def initialize 
    @transactions = []
  end

  def list_transactions
    return @transactions
  end

  def balance
    total = 0
    if @transactions.empty?
      return 0
    else @transactions.each do | transaction |
      total = total + transaction[0].to_i
      end 
      return total
    end
  end

  def deposit(amount, date = Date.today)
    @transactions.push([amount, date])
  end

  def withdrawal(amount, date = Date.today)
    @transactions.push([- amount, date])
  end
end
