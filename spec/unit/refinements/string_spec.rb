require 'spec_helper'

RSpec.describe String do
  using ::BER

  describe 'ASN_SYNTAX' do
    it 'decode string' do
      expect("\004\007testing".read_ber(BER::ASN_SYNTAX)).to eql('testing')
    end
  end

  describe 'utf8' do
    # it 'encode utf8 strings' do
    #   expect("\u00e5".force_encoding('UTF-8').to_ber).to eql("\x04\x02\xC3\xA5".b)
    # end

    it 'utf8 encodable strings' do
      expect('teststring'.encode('US-ASCII').to_ber).to eql("\x04\nteststring")
    end

    # it 'non utf8 encodable strings' do
    #   expect("\x81".to_ber).to eql("\x04\x01\x81".b)
    # end
  end

  # This is used for searching for GUIDs in Active Directory
  describe 'binary' do
    it 'encode data' do
      expect(['6a31b4a12aa27a41aca9603f27dd5116'].pack('H*').to_ber_bin).to eql(
        "\x04\x10" + "j1\xB4\xA1*\xA2zA\xAC\xA9`?'\xDDQ\x16".b
      )
    end
  end
end
