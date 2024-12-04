# frozen_string_literal: true

namespace :scalar do
  desc 'Install Scalar for a specific framework'
  task :install, [:framework] do |_t, args|
    framework = args[:framework]&.downcase
    case framework
    when 'rails'
      require_relative '../scalar/installers/rails_installer'
      Scalar::Installers::RailsInstaller.install
    when 'sinatra'
      require_relative '../scalar/installers/sinatra_installer'
      Scalar::Installers::SinatraInstaller.install
    when 'grape'
      require_relative '../scalar/installers/grape_installer'
      Scalar::Installers::GrapeInstaller.install
    else
      puts "Unsupported framework. Please specify 'rails', 'sinatra', or 'grape'."
    end
  end
end
