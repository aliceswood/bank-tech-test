require 'deposit'

RSpec.describe Deposit do
  context 'it constructs' do
    it 'contructs with an amount and the default date' do
      deposit = Deposit.new(1000)
      expect(deposit.amount).to eq(1000)
      expect(deposit.date).to eq(Date.today)
    end

    it 'constructs with an amount and a given date' do
      deposit = Deposit.new(1000, '10/1/2023')
      expect(deposit.amount).to eq(1000)
      expect(deposit.date).to eq('10/1/2023')
    end
  end
end
