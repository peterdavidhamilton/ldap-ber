# Refine FalseClass
#
module BER
  refine ::FalseClass do
    def to_ber
      "\001\001\000".freeze
    end
  end
end
