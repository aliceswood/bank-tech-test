require 'date'

class Withdrawal
  attr_reader :amount, :date

  def initialize(amount, date = Date.today)
    @amount = - amount
    @date = date
  end
end
