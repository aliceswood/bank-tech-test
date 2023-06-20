require 'date'

class Account
  def initialize
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
    statement_headings = "date || credit || debit || balance\n"

    statement_headings + statement_lines.join
  end

  def statement_lines
    statement_lines = []
    @transactions.reverse.each_with_index do |transaction, index|
      line = if (transaction.amount).positive?
               "#{transaction.date} || #{transaction.amount} || || #{current_balance(index)}\n"
             else
               "#{transaction.date} || || #{transaction.amount.abs} || #{current_balance(index)}\n"
             end
      statement_lines.push(line)
    end
    statement_lines
  end

  def current_balance(current_index)
    total = 0
    @transactions.reverse.each_with_index do |transaction, index|
      total += transaction.amount.to_i if index >= current_index
    end
    total
  end
end


