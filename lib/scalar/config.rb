# frozen_string_literal: true

require 'json'
require 'singleton'

module Scalar
  class Config
    include Singleton

    DEFAULT_LIBRARY_URL = 'https://cdn.jsdelivr.net/npm/@scalar/api-reference'
    DEFAULT_PAGE_TITLE = 'API Reference'
    DEFAULT_CONFIGURATION = {}.freeze

    DEMO_CONFIGURATION = {
      url: 'https://cdn.jsdelivr.net/npm/@scalar/galaxy/dist/latest.yaml'
    }.freeze

    attr_accessor :configuration,
                  :library_url,
                  :page_title

    def initialize
      set_defaults
    end

    def configuration_to_json
      return JSON.dump(DEMO_CONFIGURATION) if configuration == :demo

      JSON.dump(configuration)
    end

    def set_defaults
      @library_url = DEFAULT_LIBRARY_URL
      @page_title = DEFAULT_PAGE_TITLE
      @configuration = DEFAULT_CONFIGURATION
    end
  end
end
