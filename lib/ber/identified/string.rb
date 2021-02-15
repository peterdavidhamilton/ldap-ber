# frozen_string_literal: true

module BER
  # Wrapper around a String
  #
  # @see BER::Function.parse_ber_object
  class BerIdentifiedString < String
    attr_accessor :ber_identifier

    def initialize(args)
      super

      return unless encoding == Encoding::BINARY

      current_encoding = encoding
      force_encoding('UTF-8')
      force_encoding(current_encoding) unless valid_encoding?
    end
  end
end
