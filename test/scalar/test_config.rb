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

      @instance.library_url = 'https://scalar.io/latest'

      assert_equal('https://scalar.io/latest', @instance.library_url)
    end

    def test_that_page_title_accessor_is_available
      assert_equal(Scalar::Config::DEFAULT_PAGE_TITLE, @instance.page_title)

      @instance.page_title = 'API Documentation'

      assert_equal('API Documentation', @instance.page_title)
    end

    def test_that_scalar_configuration_accessor_is_available
      assert_equal(Scalar::Config::DEFAULT_SCALAR_CONFIGURATION, @instance.scalar_configuration)

      @instance.scalar_configuration = { theme: 'purple' }

      assert_equal({ theme: 'purple' }, @instance.scalar_configuration)
    end

    def test_scalar_configuration_to_json_returns_serialized_configuration
      @instance.scalar_configuration = { theme: 'purple' }

      assert_equal('{"theme":"purple"}', @instance.scalar_configuration_to_json)
    end

    def test_that_specification_accessor_is_available
      assert_nil(@instance.specification)

      @instance.specification = 'https://scalar.io/api/reference'

      assert_equal('https://scalar.io/api/reference', @instance.specification)
    end

    def test_embedded_specification_returns_scalat_galaxy_specification_when_set_to_demo
      @instance.specification = :demo

      assert_equal(Scalar::Config::DEMO_SPECIFICATION, @instance.embedded_specification)
    end
  end
end
