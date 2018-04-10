require 'spec_helper'

RSpec.describe BER do
  it '#config' do
    expect(BER.config).to be_kind_of(Hash)
    expect(BER.config[:oid]).to have_key('1.3.6.1.4.1.1466.115.121.1.2')
    expect(BER.config[:response]).to have_key(25)
  end

  it '#lookup' do
    expect(BER.lookup(:response, 25)).to eql(:intermediate_response)
    expect(BER.lookup(:oid, '1.3.6.1.4.1.1466.115.121.1.2')).to eql('String')
  end

  it '#reverse_lookup' do
    expect(BER.reverse_lookup(:response, :intermediate_response)).to eql(25)
  end


  let(:syntax) do
    {
      application: {
        constructed: {
          0 => :array,        # LDAP BindRequest
          3 => :array         # LDAP SearchRequest
        },
        primitive: {
          2 => :string,       # ldapsearch sends this to unbind
        },
      },
      context_specific: {
        primitive: {
          0 => :string,       # simple auth (password)
          7 => :string        # present filter
        },
        constructed: {
          3 => :array         # equality filter
        },
      },
    }
  end

  it '#compile_syntax' do
    expect(BER.compile_syntax({}).size).to eql(256)
    expect(BER.compile_syntax(syntax).compact).to eql(%i[string array array string string array])
  end
end
