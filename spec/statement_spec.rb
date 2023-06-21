require 'statement'
require 'account'

RSpec.describe Statement do
  let(:mock_deposit1) {double(:deposit1, amount: 1000, date: '10/01/2023')}
  let(:mock_deposit2) {double(:deposit2, amount: 2000, date: '13/01/2023')} 
  let(:mock_withdrawal1) {double(:withdrawal1, amount: -500, date: '14/01/2023')}

  context 'contruction' do
    it 'constructs with an empty statement' do
      statement = Statement.new
      transactions = []
      expect(statement.generate_statement(transactions)).to eq("date || credit || debit || balance\n")
    end

    context 'after a deposit' do
      it 'after a deposit, it shows the transaction on the statement' do
        statement = Statement.new
        mock_transactions = [mock_deposit1, mock_deposit2, mock_withdrawal1]
        expect(statement.generate_statement(mock_transactions)).to eq("date || credit || debit || balance\n14/01/2023 || || 500 || 2500\n13/01/2023 || 2000 || || 3000\n10/01/2023 || 1000 || || 1000\n")
      end 
    end
  end

end