require 'account'
require 'deposit'
require 'withdrawal'
require 'statement'

RSpec.describe 'integration' do
  it 'shows the statement with transactions and the formatted headings' do
    account = Account.new
    deposit_one = Deposit.new(1000, '10/01/2023')
    deposit_two = Deposit.new(2000, '13/01/2023')
    withdrawal_one = Withdrawal.new(500, '14/01/2023')
    withdrawal_two = Withdrawal.new(500)

    account.deposit(deposit_one)
    account.deposit(deposit_two)
    account.withdrawal(withdrawal_one)
    account.withdrawal(withdrawal_two)

    expect(account.total_balance).to eq(2000)
    expect(account.show_statement).to eq(
      "date || credit || debit || balance\n#{Date.today} || || 500 || 2000\n14/01/2023 || || 500 || 2500\n13/01/2023 || 2000 || || 3000\n10/01/2023 || 1000 || || 1000\n"
    )
  end
end