RSpec.describe BER do
  describe 'hash mapping' do
    it '#config' do
      expect(BER.config).to be_kind_of(Hash)
      expect(BER.config[:types]).to have_key('1.3.6.1.4.1.1466.115.121.1.2')
      expect(BER.config[:response]).to have_key(25)
    end

    it '#lookup' do
      expect(BER.lookup(:response, 25)).to eql(:intermediate_response)
      expect(BER.lookup(:types, '1.3.6.1.4.1.1466.115.121.1.2')).to eql('String')
    end

    it '#reverse_lookup' do
      expect(BER.reverse_lookup(:response, :intermediate_response)).to eql(25)
      expect(BER.reverse_lookup(:types, 'Bool')).to eql('1.3.6.1.4.1.1466.115.121.1.7')
    end
  end

  describe 'syntax compilation' do
    let(:syntax) do
      {
        application: {
          constructed: {
            0 => :array,        # LDAP BindRequest
            3 => :array         # LDAP SearchRequest
          },
          primitive: {
            2 => :string,       # ldapsearch sends this to unbind
          }
        },
        context_specific: {
          primitive: {
            0 => :string,       # simple auth (password)
            7 => :string        # present filter
          },
          constructed: {
            3 => :array         # equality filter
          }
        }
      }
    end

    it '#compile_syntax' do
      expect(BER.compile_syntax({}).size).to eql(256)
      expect(BER.compile_syntax(syntax).compact).to eql(%i[string array array string string array])
    end
  end
end
