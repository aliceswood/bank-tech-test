require 'account'

RSpec.describe Account do
  context 'it constructs' do
    it 'constructs with 0 balance and 0 transactions' do
      account = Account.new
      expect(account.balance).to eq(0)
      expect(account.list_transactions).to eq([])
    end
  end

  context 'it makes a deposit' do
    it 'makes a deposit with a given date' do
      account = Account.new
      account.deposit(1000, '10/01/2023')
      expect(account.balance).to eq(1000)
      expect(account.list_transactions).to eq([[1000, '10/01/2023']])
    end

    it 'makes a deposit using default date' do
      account = Account.new
      account.deposit(1000)
      expect(account.balance).to eq(1000)
      expect(account.list_transactions).to eq([[1000, Date.today]])
    end
  end

  context 'multiple deposits' do
    it 'returns the list of transactions and a cumulative balance' do
      account = Account.new
      account.deposit(1000, '10/01/2023')
      account.deposit(2000, '13/01/2023')
      expect(account.balance).to eq(3000)
      expect(account.list_transactions).to eq([[1000, '10/01/2023'], [2000, '13/01/2023']])
    end
  end

  context 'withdrawals' do
    it 'makes a withdrawal with a given date' do
      account = Account.new
      account.withdrawal(500, '14/01/2023')
      expect(account.balance).to eq(-500)
      expect(account.list_transactions).to eq([[-500, '14/01/2023']])
    end

    it 'makes a withdrawal using the default date' do
      account = Account.new
      account.withdrawal(500)
      expect(account.balance).to eq(-500)
      expect(account.list_transactions).to eq([[-500, Date.today]])
    end

    it 'makes multiple withdrawals and the account balance is cumulative' do
      account = Account.new
      account.withdrawal(500)
      account.withdrawal(500, '14/01/2023')
      expect(account.balance).to eq(-1000)
      expect(account.list_transactions).to eq([[-500, Date.today], [-500, '14/01/2023']])
    end
  end

  context 'deposits and withdrawals made' do
    it 'makes deposits and withdrawals and the account balance reflects correctly' do
      account = Account.new
      account.deposit(1000, '10/01/2023')
      account.deposit(2000, '13/01/2023')
      account.withdrawal(500)
      account.withdrawal(500, '14/01/2023')
      expect(account.balance).to eq(2000)
      expect(account.list_transactions).to eq([[1000, '10/01/2023'], [2000, '13/01/2023'], [-500, Date.today], [-500, '14/01/2023']])
    end
  end
end