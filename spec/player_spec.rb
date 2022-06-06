require './lib/player'
# rspec spec/player_spec.rb

describe Player do
  describe '#ask_piece' do
    context 'When inputting a value' do
      subject(:player_piece) { described_class.new }

      before do
        valid_value = 'X'
        allow(player_piece).to receive(:gets).and_return(valid_value)
      end

      it 'is a valid value' do
        error_message = 'NOT X OR O'
        expect(player_piece).to_not eq(error_message)
      end

      xit 'is an invalid value' do
      end
    end
  end
end