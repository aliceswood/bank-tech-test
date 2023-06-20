require 'deposit'

RSpec.describe Deposit do
  context 'it constructs' do
    it 'contructs with an amount and the default date' do
      deposit = Deposit.new(1000)
      deposit.make_deposit
      expect(deposit.get_deposits).to eq([1000, Date.today])
    end

    it 'constructs with an amount and a given date' do
      deposit = Deposit.new(1000, '10/01/2023')
      deposit.make_deposit
      expect(deposit.get_deposits).to eq([1000, '10/01/2023'])
    end
  end
end