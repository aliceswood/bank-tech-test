require './lib/account'
require './lib/deposit'
require './lib/withdrawal'
require './lib/statement'

deposit_one = Deposit.new(1000, '10/01/2023')
deposit_two = Deposit.new(2000, '13/01/2023')
withdrawal_one = Withdrawal.new(500, '14/01/2023')

statement_printer = Statement.new
account = Account.new(statement_printer)

account.deposit(deposit_one)
account.deposit(deposit_two)
account.withdrawal(withdrawal_one)

account.show_statement