RSpec.describe BER do
  describe 'hash mapping' do
    it '#config' do
      expect(BER.config).to be_kind_of(Hash)
      expect(BER.config[:response]).to have_key(25)
      expect(BER.config[:result]).to have_key(0)
      expect(BER.config[:result]).to_not have_key(22)
    end

    it '#lookup' do
      expect(BER.lookup(:response, 25)).to eql(:intermediate_response)
      expect(BER.lookup(:result, 0)).to eql(:success)
    end

    it '#reverse_lookup' do
      expect(BER.reverse_lookup(:response, :intermediate_response)).to eql(25)
      expect(BER.reverse_lookup(:result, :success)).to eql(0)
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
