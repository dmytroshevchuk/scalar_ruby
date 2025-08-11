# frozen_string_literal: true

Scalar.setup do |config|
  # Specify the version of the Scalar. By default, it uses the latest one
  #
  # config.library_url = "https://cdn.jsdelivr.net/npm/@scalar/api-reference"

  # Add custom page title displayed in the browser tab
  #
  # config.page_title = "API Reference"

  # Pass your API specification. It may be :demo, a URL or file content in the
  # OpenAPI format.
  #
  # config.specification = :demo

  # Set additional Scalar configuration (e.g. theme, multiple specifications or,
  # document sources, etc.)
  #
  # config.scalar_configuration = {
  #   theme: "purple"
  # }
end
