require 'withdrawal'

RSpec.describe Withdrawal do
  context 'it constructs' do
    it 'contructs with an amount and the default date' do
      withdrawal = Withdrawal.new(1000)
      expect(withdrawal.amount).to eq(-1000)
      expect(withdrawal.date).to eq(Date.today)
    end

    it 'constructs with an amount and a given date' do
      withdrawal = Withdrawal.new(1000, '10/1/2023')
      expect(withdrawal.amount).to eq(-1000)
      expect(withdrawal.date).to eq('10/1/2023')
    end
  end
end
