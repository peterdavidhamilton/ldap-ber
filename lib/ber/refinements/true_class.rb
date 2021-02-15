# frozen_string_literal: true

# Refine TrueClass
#
module BER
  refine ::TrueClass do
    # @return [String]
    #
    # @api public
    def to_ber
      (+"\001\001\xFF").force_encoding('ASCII-8BIT').freeze
    end
  end
end
