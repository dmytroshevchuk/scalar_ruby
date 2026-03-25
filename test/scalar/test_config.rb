# frozen_string_literal: true

require 'test_helper'

module Scalar
  class TestConfig < Minitest::Test
    def setup
      Scalar::Config.instance.set_defaults

      @instance = Scalar::Config.instance
    end

    def test_that_library_url_accessor_is_available
      assert_equal(Scalar::Config::DEFAULT_LIBRARY_URL, @instance.library_url)

      @instance.library_url = 'https://example.com/latest'

      assert_equal('https://example.com/latest', @instance.library_url)
    end

    def test_that_page_title_accessor_is_available
      assert_equal(Scalar::Config::DEFAULT_PAGE_TITLE, @instance.page_title)

      @instance.page_title = 'API Documentation'

      assert_equal('API Documentation', @instance.page_title)
    end

    def test_that_configuration_accessor_is_available
      assert_equal(Scalar::Config::DEFAULT_CONFIGURATION, @instance.configuration)

      @instance.configuration = { theme: 'purple' }

      assert_equal({ theme: 'purple' }, @instance.configuration)
    end

    def test_configuration_to_json_returns_serialized_configuration
      @instance.configuration = { theme: 'purple' }

      assert_equal('{"theme":"purple"}', @instance.configuration_to_json)
    end

    def test_configuration_to_json_returns_demo_configuration_when_set_to_demo
      @instance.configuration = :demo

      assert_equal(JSON.dump(Scalar::Config::DEMO_CONFIGURATION), @instance.configuration_to_json)
    end
  end
end
