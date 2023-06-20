require 'date'


class Deposit
  attr_reader :amount, :date
  
  def initialize(amount, date = Date.today)
    @amount = amount
    @date = date
  end
end