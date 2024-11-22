# frozen_string_literal: true

require 'test_helper'

class Scalar::TestUI < Minitest::Test
  def setup
    Scalar::Config.instance.set_defaults!

    @status, @headers, @body = Scalar::UI.call({})
  end

  def test_call_responds_200_status
    assert_equal(200, @status)
  end

  def test_call_responds_correct_headers
    assert_equal({ 'Content-Type' => 'text/html; charset=utf-8' }, @headers)
  end

  def test_call_responds_with_html_template
    body_per_line = @body.first.split("\n")

    assert_equal(
      [
        '<!doctype html>',
        '<html>',
        '  <head>',
        '    <title>API Reference</title>',
        '',
        '    <meta charset="utf-8" />',
        '    <meta name="viewport" content="width=device-width, initial-scale=1" />',
        '  </head>',
        '',
        '  <body>',
        '    <script',
        '      id="api-reference"',
        '      data-configuration={}',
        '    >',
        '      {"openapi":"3.1.0","info":{"title":"Scalar API Reference","description":"Add your OpenAPI specification to leverage the full power of Scalar!\n\n## Resources\n\n* https://github.com/scalar/scalar\n* https://github.com/OAI/OpenAPI-Specification\n* https://scalar.com\n","version":"1.0.0"}}',
        '    </script>',
        '',
        '    <script src="https://cdn.jsdelivr.net/npm/@scalar/api-reference"></script>',
        '  </body>',
        '</html>'
      ],
      body_per_line
    )
  end
end


