require 'withdrawal'

RSpec.describe Withdrawal do
  context 'it constructs' do
    it 'contructs with an amount and the default date' do
      withdrawal = Withdrawal.new(1000)
      withdrawal.make_withdrawal
      expect(withdrawal.get_withdrawals).to eq([-1000, Date.today])
    end

    it 'constructs with an amount and a given date' do
      withdrawal = Withdrawal.new(1000, '10/01/2023')
      withdrawal.make_withdrawal
      expect(withdrawal.get_withdrawals).to eq([-1000, '10/01/2023'])
    end
  end
end