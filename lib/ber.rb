# frozen_string_literal: true

require 'dry/core/constants'
require 'yaml'
require 'pathname'
require 'ber/version'
require 'ber/function'
require 'ber/refinements'

# Basic Encoding Rules
#
module BER
  include Dry::Core::Constants

  def self.function
    @function ||= Function.new
  end

  # Path to gem root
  #
  # @return [Pathname]
  #
  # @api private
  def self.root
    Pathname(File.dirname(__FILE__))
  end

  #
  #
  # @return [Hash]
  #
  # @api private
  def self.config
    @config ||= YAML.load_file(root.join('ber.yaml')).freeze
  end

  #
  #
  # @param type [Symbol] (:response)
  #
  # @param val [Integer, Symbol]
  #
  # @return [Symbol, Integer]
  #
  # @api private
  def self.fetch(type, val)
    case val
    when Integer then config[type][val]
    when Symbol  then config[type].key(val)
    end
  end

  def self.compile_syntax(syntax)
    out = [nil] * 256

    syntax.each do |tag_class_id, encodings|
      tag_class = config[:tag_class][tag_class_id]
      encodings.each do |encoding_id, classes|
        encoding     = config[:encoding_type][encoding_id]
        object_class = tag_class + encoding
        classes.each do |number, object_type|
          out[object_class + number] = object_type
        end
      end
    end

    out
  end

  Error = Class.new(RuntimeError)

  ASN_SYNTAX       = compile_syntax(config[:syntax]).freeze
  IDENTIFIED       = compile_syntax(config[:identified_type]).freeze
  MAX_FIXNUM_SIZE  = 0.size
  WILDCARD         = '*'
end
