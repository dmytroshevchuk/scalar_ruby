# frozen_string_literal: true

require 'test_helper'

module Scalar
  class TestUI < Minitest::Test
    def setup
      Scalar::Config.instance.configuration = :demo

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
          '    <div id="app"></div>',
          '',
          '    <script src="https://cdn.jsdelivr.net/npm/@scalar/api-reference"></script>',
          '',
          '    <script>',
          '      Scalar.createApiReference(',
          '        \'#app\',',
          '        {"url":"https://cdn.jsdelivr.net/npm/@scalar/galaxy/dist/latest.yaml"}',
          '      )',
          '    </script>',
          '  </body>',
          '</html>'
        ],
        body_per_line
      )
    end
  end
end
