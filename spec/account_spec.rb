require 'account'
require 'byebug'

RSpec.describe Account do
  let(:mock_deposit1) { double(:deposit1, amount: 1000, date: '10/01/2023') }
  let(:mock_deposit2) { double(:deposit2, amount: 2000, date: '13/01/2023') }
  let(:mock_withdrawal1) { double(:withdrawal1, amount: -500, date: '14/01/2023') }
  let(:mock_withdrawal2) { double(:withdrawal2, amount: -1000, date: '15/01/2023') }
  let(:mock_statement_printer) do
    double(:statement_printer,
           generate_statement: "date || credit || debit || balance\n14/01/2023 || || 500 || 2500\n13/01/2023 || 2000 || || 3000\n10/01/2023 || 1000 || || 1000\n")
  end

  context 'it constructs' do
    it 'constructs with 0 balance and 0 transactions' do
      account = Account.new(mock_statement_printer)
      expect(account.total_balance).to eq(0)
      expect(account.list_transactions).to eq([])
    end
  end

  it 'makes a deposit' do
    account = Account.new(mock_statement_printer)
    account.deposit(mock_deposit1)
    expect(account.total_balance).to eq(1000)
    expect(account.list_transactions).to eq([mock_deposit1])
  end

  context 'multiple deposits' do
    it 'returns the list of transactions and a cumulative balance' do
      account = Account.new(mock_statement_printer)
      account.deposit(mock_deposit1)
      account.deposit(mock_deposit2)
      expect(account.total_balance).to eq(3000)
      expect(account.list_transactions).to eq([mock_deposit1, mock_deposit2])
    end
  end

  context 'withdrawals' do
    it 'makes a withdrawal with a given date' do
      account = Account.new(mock_statement_printer)
      account.withdrawal(mock_withdrawal1)
      expect(account.total_balance).to eq(-500)
      expect(account.list_transactions).to eq([mock_withdrawal1])
    end

    it 'makes multiple withdrawals and the account balance is cumulative' do
      account = Account.new(mock_statement_printer)
      account.withdrawal(mock_withdrawal1)
      account.withdrawal(mock_withdrawal2)
      expect(account.total_balance).to eq(-1500)
      expect(account.list_transactions).to eq([mock_withdrawal1, mock_withdrawal2])
    end
  end

  context 'deposits and withdrawals made' do
    it 'makes deposits and withdrawals and the account balance reflects correctly' do
      account = Account.new(mock_statement_printer)
      account.deposit(mock_deposit1)
      account.deposit(mock_deposit2)
      account.withdrawal(mock_withdrawal1)
      account.withdrawal(mock_withdrawal2)
      expect(account.total_balance).to eq(1500)
      expect(account.list_transactions).to eq([mock_deposit1, mock_deposit2, mock_withdrawal1,
                                               mock_withdrawal2])
    end
  end

  context 'showing the statement' do
    it 'shows the statement with transactions and the formatted headings' do
      account = Account.new(mock_statement_printer)
      account.deposit(mock_deposit1)
      account.deposit(mock_deposit2)
      account.withdrawal(mock_withdrawal1)
      expect(account.total_balance).to eq(2500)
      expect(account.list_transactions).to eq([mock_deposit1, mock_deposit2, mock_withdrawal1])
      expect(account.show_statement).to eq(
        "date || credit || debit || balance\n14/01/2023 || || 500 || 2500\n13/01/2023 || 2000 || || 3000\n10/01/2023 || 1000 || || 1000\n"
      )
    end
  end
end
