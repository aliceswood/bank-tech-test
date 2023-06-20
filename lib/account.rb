require 'date'

class Account
  def initialize 
    @total = 0
    @transactions = []
  end

  def list_transactions
    return @transactions
  end

  def balance
    @transactions.each do | transaction |
      @total = @total + transaction[0].to_i
      end 
    return @total
  end

  def deposit(amount, date = Date.today)
    @transactions.push([amount, date])
  end

  def withdrawal(amount, date = Date.today)
    @transactions.push([- amount, date])
  end
end
