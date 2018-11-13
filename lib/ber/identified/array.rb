# frozen_string_literal: true

module BER
  class BerIdentifiedArray < Array
    attr_accessor :ber_identifier

    def initialize(*args)
      super
    end
  end
end
