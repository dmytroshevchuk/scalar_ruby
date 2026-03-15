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
    assert_equal(Scalar::Config::DEFAULT_CONFIGURATION, @config.configuration)
  end

  def test_setup_allows_to_change_config
    Scalar.setup do |config|
      config.library_url = 'https://example.com/latest'
      config.page_title = 'Test API Reference'
      config.configuration = { theme: 'purple', url: 'https://example.com/api/reference' }
    end

    assert_equal('https://example.com/latest', @config.library_url)
    assert_equal('Test API Reference', @config.page_title)
    assert_equal({ theme: 'purple', url: 'https://example.com/api/reference' }, @config.configuration)
  end
end
