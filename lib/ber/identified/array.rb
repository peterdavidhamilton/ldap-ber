# frozen_string_literal: true

module BER
  # Wrapper around an Array
  #
  # @see BER::Function.parse_ber_object
  class BerIdentifiedArray < Array
    attr_accessor :ber_identifier

    def initialize(*args)
      super
    end
  end
end
