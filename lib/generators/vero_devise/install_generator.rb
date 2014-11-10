require 'rails/generators/base'
require 'securerandom'

module VeroDevise
  module Generators
    # InstallGenerator create the conf to Devise integration with Vero
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates the default configuration file for VeroDevise'

      def copy_initializer
        template 'vero_devise.rb', 'config/initializers/vero_devise.rb'
      end
    end
  end
end
