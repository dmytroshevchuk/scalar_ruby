# frozen_string_literal: true

module Scalar
  module Installers
    module Rails
      class Installer
        def self.install
          system('bin/rails generate scalar:rails')
        end
      end
    end
  end
end
