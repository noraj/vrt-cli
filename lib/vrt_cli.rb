# frozen_string_literal: true

# Project internal
require 'vrt_cli/parse'
require 'vrt_cli/output'
require 'vrt_cli/version'

# VRT CLI module
module VrtCli
  # Constants
  include Version

  # The application
  class App
    SEVERITY = {
      1 => :red,
      2 => 'orange',
      3 => :yellow,
      4 => :green,
      5 => :blue,
      '?' => 'grey'
    }.freeze

    attr_reader :vulnerabilities, :categories

    def initialize
      @vulnerabilities = parse
      @categories = VRT.current_categories.map { |x| x[:label] }
    end
  end
end
