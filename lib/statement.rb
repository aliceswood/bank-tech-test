class Statement
  def generate_statement(transactions)
    statement_headings = "date || credit || debit || balance\n"

    statement_headings + statement_lines(transactions).join
  end

  def statement_lines(transactions)
    statement_lines = []
    transactions.reverse.each_with_index do |transaction, index|
      line = if (transaction.amount).positive?
               "#{transaction.date} || #{transaction.amount} || || #{current_balance(transactions, index)}\n"
             else
               "#{transaction.date} || || #{transaction.amount.abs} || #{current_balance(transactions, index)}\n"
             end
      statement_lines.push(line)
    end
    statement_lines
  end

  def current_balance(transactions, current_index)
    total = 0
    transactions.reverse.each_with_index do |transaction, index|
      total += transaction.amount.to_i if index >= current_index
    end
    total
  end
end