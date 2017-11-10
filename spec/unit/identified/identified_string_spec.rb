require 'spec_helper'
require 'ber/identified/string'

RSpec.describe BER::BerIdentifiedString do
  using ::BER

  let(:data) { '' }
  let(:bis)  { BER::BerIdentifiedString.new(data) }

  # it 'binary data' do
  #   data = ['6a31b4a12aa27a41aca9603f27dd5116'].pack('H*').force_encoding('ASCII-8BIT')

  #   expect(bis.valid_encoding?).to be(true)
  #   expect(bis.encoding.name).to eql('ASCII-8BIT')
  # end

  it 'ascii data in utf8' do
    data = 'some text'.force_encoding('UTF-8')

    expect(bis.valid_encoding?).to be(true)
    expect(bis.encoding.name).to eql('UTF-8')
  end

  it 'umlaut data in utf8' do
    data = 'Müller'.force_encoding('UTF-8')

    expect(bis.valid_encoding?).to be(true)
    expect(bis.encoding.name).to eql('UTF-8')
  end

  it 'utf8 data in utf8' do
    data = ['e4b8ad'].pack('H*').force_encoding('UTF-8')

    expect(bis.valid_encoding?).to be(true)
    expect(bis.encoding.name).to eql('UTF-8')
  end
end
