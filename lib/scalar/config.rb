# frozen_string_literal: true

require 'json'
require 'singleton'

module Scalar
  class Config
    include Singleton

    DEFAULT_LIBRARY_URL = 'https://cdn.jsdelivr.net/npm/@scalar/api-reference'
    DEFAULT_PAGE_TITLE = 'API Reference'
    DEFAULT_SCALAR_CONFIGURATION = {}.freeze

    DEMO_SPECIFICATION = 'https://cdn.jsdelivr.net/npm/@scalar/galaxy/dist/latest.yaml'

    attr_accessor :library_url,
                  :page_title,
                  :scalar_configuration,
                  :specification

    def initialize
      set_defaults
    end

    def scalar_configuration_to_json
      JSON.dump(scalar_configuration)
    end

    def set_defaults
      @library_url = DEFAULT_LIBRARY_URL
      @page_title = DEFAULT_PAGE_TITLE
      @scalar_configuration = DEFAULT_SCALAR_CONFIGURATION
      @specification = nil
    end

    def embedded_specification
      return if specification.nil?
      return DEMO_SPECIFICATION if specification.to_sym == :demo

      specification
    end
  end
end
