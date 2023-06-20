require 'date'

class Deposit
  def initialize(amount, date = Date.today)
    @amount = amount
    @date = date
    @deposit = []
  end

  def get_deposits
    return @deposit
  end

  def make_deposit
    @deposit.push(@amount, @date)
  end
end