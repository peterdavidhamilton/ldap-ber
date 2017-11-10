require 'spec_helper'

#
# http://tools.ietf.org/html/rfc4511#section-5.1
#
RSpec.describe 'Boolean' do
  using ::BER

  it 'true' do
    expect(true.to_ber).to eql("\x01\x01\xFF".b)
    expect("\x01\x01\xFF".read_ber).to be(true)
  end

  it 'false' do
    expect(false.to_ber).to eql("\x01\x01\x00".b)
    expect("\x01\x01\x00".read_ber).to be(false)
  end
end
