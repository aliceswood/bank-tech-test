require '../lib/account'

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
end