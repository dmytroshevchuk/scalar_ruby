# frozen_string_literal: true

module Scalar
  module Installers
    module Grape
      class Installer
        def self.install
          File.write('config/initializer_scalar.rb', grape_initializer_content)
        end

        def self.grape_initializer_content
          <<~CONTENT
            # Scalar Grape configuration
            Scalar.configure do |config|
              # Add custom configurations
            end
          CONTENT
        end
      end
    end
  end
end
