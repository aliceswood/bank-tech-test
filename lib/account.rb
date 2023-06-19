require 'date'

class Account
  def initialize 
    @transactions = []
  end

  def list_transactions
    return @transactions
  end

  def balance
    if @transactions.empty?
      return 0
    else @transactions.each do | transaction |
      total = 0
      new_total = total + transaction[0].to_i
      return new_total
      end
    end
  end

  def deposit(amount, date = Date.today)
    @transactions.push([amount, date])
  end


end
