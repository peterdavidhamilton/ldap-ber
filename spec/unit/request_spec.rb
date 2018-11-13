RSpec.describe 'LDAP Requests' do
  using ::BER

  describe 'consumed' do
    let(:bind_request) do
      "0$\002\001\001`\037\002\001\003\004\rAdministrator\200\vad_is_bogus"
    end

    it 'decode bind request' do
      expect(bind_request.read_ber(BER::ASN_SYNTAX)).to eql([1, [3, 'Administrator', 'ad_is_bogus']])
    end

    xit 'exception does not modify string' do
      duplicate = bind_request.dup

      expect_any_instance_of(StringIO).to receive(:read_ber).and_raise(BER::Error)

      expect { duplicate.read_ber!(BER::ASN_SYNTAX) }.to raise_error(BER::Error)

      expect(bind_request).to eql(duplicate)
    end
  end

  describe 'ASN_SYNTAX' do
    let(:bind_request) do
      "0$\002\001\001`\037\002\001\003\004\rAdministrator\200\vad_is_bogus UNCONSUMED".b
    end

    it 'parse ber' do
      expect(bind_request.read_ber!(BER::ASN_SYNTAX)).to eql([1, [3, 'Administrator', 'ad_is_bogus']])
    end

    it 'unconsumed message' do
      bind_request.read_ber!(BER::ASN_SYNTAX)
      expect(bind_request).to eql(' UNCONSUMED')
    end
  end
end
