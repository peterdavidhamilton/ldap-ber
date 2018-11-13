RSpec.describe 'BerIdentifiedString' do
  using ::BER

  context 'UTF8' do
    let(:bis) { BER::BerIdentifiedString.new(data) }

    describe 'with ascii data' do
      let(:data) { 'some text'.force_encoding('UTF-8') }

      it do
        expect(bis.valid_encoding?).to be(true)
        expect(bis.encoding.name).to eql('UTF-8')
      end
    end

    describe 'with umlaut data' do
      let(:data) { 'Müller'.force_encoding('UTF-8') }

      it do
        expect(bis.valid_encoding?).to be(true)
        expect(bis.encoding.name).to eql('UTF-8')
      end
    end

    describe 'with utf8 data' do
      let(:data) { ['e4b8ad'].pack('H*').force_encoding('UTF-8') }

      it do
        expect(bis.valid_encoding?).to be(true)
        expect(bis.encoding.name).to eql('UTF-8')
      end
    end
  end

  context 'BINARY' do
    it do
      data = ['6a31b4a12aa27a41aca9603f27dd5116'].pack('H*').force_encoding('ASCII-8BIT')
      bis  = BER::BerIdentifiedString.new(data)

      expect(data.encoding.name).to eql('ASCII-8BIT')

      expect(bis.valid_encoding?).to be(true)
      expect(bis.encoding.name).to eql('ASCII-8BIT')
    end
  end
end
