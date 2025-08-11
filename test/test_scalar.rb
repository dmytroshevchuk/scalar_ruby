# frozen_string_literal: true

require 'test_helper'

class TestScalar < Minitest::Test
  def setup
    @config = Scalar::Config.instance

    @config.set_defaults
  end

  def test_default_values
    assert_equal(Scalar::Config::DEFAULT_LIBRARY_URL, @config.library_url)
    assert_equal(Scalar::Config::DEFAULT_PAGE_TITLE, @config.page_title)
    assert_equal(Scalar::Config::DEFAULT_SCALAR_CONFIGURATION, @config.scalar_configuration)
    assert_nil(@config.specification)
  end

  # def test_setting_demo_specification
  #   assert_nil(@config.specification)

  #   @config.set_demo_specification

  #   assert_equal(Scalar::Config::DEMO_SPECIFICATION, @config.specification)
  # end

  def test_setup_allows_to_change_config
    Scalar.setup do |config|
      config.library_url = 'https://scalar.io/latest'
      config.page_title = 'Test API Reference'
      config.scalar_configuration = { theme: 'purple' }
      config.specification = 'https://scalar.io/api/reference'
    end

    assert_equal('https://scalar.io/latest', @config.library_url)
    assert_equal('Test API Reference', @config.page_title)
    assert_equal({ theme: 'purple' }, @config.scalar_configuration)
    assert_equal('https://scalar.io/api/reference', @config.specification)
  end
end
