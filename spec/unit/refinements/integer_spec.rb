require 'spec_helper'

RSpec.describe Integer do
  using ::BER

  it 'decode number' do
    expect("\002\001\006".read_ber(BER::ASN_SYNTAX)).to eql(6)
  end

  let(:sample) do
    {
      0             => "\x02\x01\x00",
      1             => "\x02\x01\x01",
      127           => "\x02\x01\x7F",
      128           => "\x02\x02\x00\x80",
      255           => "\x02\x02\x00\xFF",
      256           => "\x02\x02\x01\x00",
      65_535        => "\x02\x03\x00\xFF\xFF",
      65_536        => "\x02\x03\x01\x00\x00",
      8_388_607     => "\x02\x03\x7F\xFF\xFF",
      8_388_608     => "\x02\x04\x00\x80\x00\x00",
      16_777_215    => "\x02\x04\x00\xFF\xFF\xFF",
      0x01000000    => "\x02\x04\x01\x00\x00\x00",
      0x3FFFFFFF    => "\x02\x04\x3F\xFF\xFF\xFF",
      0x4FFFFFFF    => "\x02\x04\x4F\xFF\xFF\xFF",

      5             => "\x02\x01\x05",
      500           => "\x02\x02\x01\xf4",
      50_000        => "\x02\x03\x00\xC3\x50",
      5_000_000_000 => "\x02\x05\x01\x2a\x05\xF2\x00",

      -1            => "\x02\x01\xFF",
      -127          => "\x02\x01\x81",
      -128          => "\x02\x01\x80",
      -255          => "\x02\x02\xFF\x01",
      -256          => "\x02\x02\xFF\x00",
      -65_535       => "\x02\x03\xFF\x00\x01",
      -65_536       => "\x02\x03\xFF\x00\x00",
      -65_537       => "\x02\x03\xFE\xFF\xFF",
      -8_388_607    => "\x02\x03\x80\x00\x01",
      -8_388_608    => "\x02\x03\x80\x00\x00",
      -16_777_215   => "\x02\x04\xFF\x00\x00\x01"
    }
  end

  it 'integers' do
    sample.each do |int, encoded_int|
      expect(int.to_ber).to eql(encoded_int.b)
      expect(encoded_int.b.read_ber).to eql(int)
    end
  end

  describe 'round trip' do
    it 'powers of two' do
      100.times do |i|
        n = 2 << i
        expect(n.to_ber.read_ber).to eql(n)
      end
    end

    it 'powers of ten' do
      100.times do |i|
        n = 5 * 10**i
        expect(n.to_ber.read_ber).to eql(n)
      end
    end
  end
end
