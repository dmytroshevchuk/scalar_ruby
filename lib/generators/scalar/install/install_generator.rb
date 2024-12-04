# frozen_string_literal: true

module Scalar
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      desc 'Installs Scalar into a Rails app'

      def introduction
        say <<~INTRODUCTION

          👋 Let's install Scalar into your Rails app!

        INTRODUCTION
      end

      def update_routes
        insert_into_file Rails.root.join('config/routes.rb'), after: 'Rails.application.routes.draw do' do
          "\n  mount Scalar::UI, at: \"/docs\""
        end
      end

      def create_initializer
        template 'initializer.rb', 'config/initializers/scalar.rb'
      end

      def farewell
        say <<~FAREWELL

          We're done!  Your can run "/docs" to observe a scalar API platform

        FAREWELL
      end
    end
  end
end
