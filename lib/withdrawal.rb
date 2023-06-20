require 'date'

class Withdrawal
  def initialize(amount, date = Date.today)
    @amount = amount
    @date = date
    @withdrawal = []
  end

  def get_withdrawals
    return @withdrawal
  end

  def make_withdrawal
    @withdrawal.push(-@amount, @date)
  end
end
