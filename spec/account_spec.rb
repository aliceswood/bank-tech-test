require '../lib/account'

RSpec.describe Account do
  context 'it constructs' do
    it 'constructs with 0 balance and 0 transactions' do
      account = Account.new
      expect(account.balance).to eq(0)
      expect(account.list_transactions).to eq([])
    end
  end
end