# frozen_string_literal: true

module Scalar
  module Installers
    module Sinatra
      class Installer
        def self.install
          File.write('config/initializer_scalar.rb', sinatra_initializer_content)
        end

        def self.sinatra_initializer_content
          <<~CONTENT
            # Scalar Sinatra configuration
            Scalar.configure do |config|
              # Add custom configurations
            end
          CONTENT
        end
      end
    end
  end
end
