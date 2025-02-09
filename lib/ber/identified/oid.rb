# frozen_string_literal: true

module BER
  class BerIdentifiedOid
    attr_accessor :ber_identifier

    def initialize(oid)
      @value = oid.split(/\./).map(&:to_i) if oid.is_a?(String)
    end

    def to_ber
      to_ber_oid
    end

    def to_ber_oid
      @value.to_ber_oid
    end

    def to_s
      @value.join('.')
    end

    def to_arr
      @value.dup
    end
  end
end
