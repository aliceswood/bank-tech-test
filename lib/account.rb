require 'date'

class Account
  attr_reader :transactions

  def initialize(statement_printer)
    @statement_printer = statement_printer
    @transactions = []
  end

  def list_transactions
    @transactions
  end

  def total_balance
    total = 0
    @transactions.each do |transaction|
      total += transaction.amount.to_i
    end
    total
  end

  def deposit(deposit)
    @transactions.push(deposit)
  end

  def withdrawal(withdrawal)
    @transactions.push(withdrawal)
  end

  def show_statement
    @statement_printer.generate_statement(@transactions)
  end
end
