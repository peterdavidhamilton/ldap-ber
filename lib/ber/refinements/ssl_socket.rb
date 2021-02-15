# frozen_string_literal: true

# Refine ::OpenSSL::SSL::SSLSocket
#
module BER
  if defined? ::OpenSSL
    refine ::OpenSSL::SSL::SSLSocket do
      def read_ber(syntax = ::BER::ASN_SYNTAX)
        ::BER.function.read_ber(self, syntax)
      end

      def read_ber_length
        ::BER.function.read_ber_length(self)
      end

      def parse_ber_object(syntax, id, data)
        ::BER.function.parse_ber_object(self, syntax, id, data)
      end
    end
  end
end
