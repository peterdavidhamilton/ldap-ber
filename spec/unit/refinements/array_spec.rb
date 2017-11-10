require 'spec_helper'

RSpec.describe Array do
  using ::BER

  describe 'read_ber' do
    it 'empty array' do
      expect([].to_ber.read_ber).to eql([])
    end

    it 'array' do
      expect([1, 2, 3].map(&:to_ber).to_ber.read_ber).to eql([1, 2, 3])
    end
  end

  describe 'to_ber_control' do
    it 'control code array' do
      control_codes = []
      control_codes << ['1.2.3'.to_ber, true.to_ber].to_ber_sequence
      control_codes << ['1.7.9'.to_ber, false.to_ber].to_ber_sequence
      control_codes = control_codes.to_ber_sequence

      expect(control_codes).to eql([['1.2.3', true], ['1.7.9', false]].to_ber_control)
    end

    it 'wrap array if not nested' do
      expect(['1.2.3', true].to_ber_control).to eql([['1.2.3', true]].to_ber_control)
    end

    it 'empty string if empty array' do
      expect([].to_ber_control).to eql('')
    end
  end
end
