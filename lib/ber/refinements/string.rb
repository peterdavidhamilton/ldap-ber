require 'stringio'

# Refine String
#
module BER
  refine ::String do
    def read_ber(syntax = nil)
      ::StringIO.new(self).read_ber(syntax)
    end

    def read_ber!(syntax = nil)
      io     = ::StringIO.new(self)
      result = io.read_ber(syntax)
      slice!(0...io.pos)
      result
    end

    def read_ber_length
      ::BER.function.read_ber_length(self)
    end

    def parse_ber_object(syntax, id, data)
      ::BER.function.parse_ber_object(self, syntax, id, data)
    end

    def to_ber(code = 0x04)
      raw_string = ascii_encoded
      [code].pack('C') + raw_string.length.to_ber_length_encoding + raw_string
    end

    def to_ber_bin(code = 0x04)
      [code].pack('C') + length.to_ber_length_encoding + self
    end

    def to_ber_application_string(code)
      to_ber(0x40 + code)
    end

    def to_ber_contextspecific(code)
      to_ber(0x80 + code)
    end

    def reject_empty_ber_arrays
      gsub(/0\000/n, '')
    end

    private

    def ascii_encoded
      encode('UTF-8').force_encoding('ASCII-8BIT')
    rescue Encoding::UndefinedConversionError,
           Encoding::ConverterNotFoundError,
           Encoding::InvalidByteSequenceError
      self
    end
  end
end
