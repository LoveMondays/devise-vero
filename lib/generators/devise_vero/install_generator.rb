require 'rails/generators/base'

module Devise
  module Vero
    module Generators
      # InstallGenerator create the conf to Devise integration with Vero
      class InstallGenerator < Rails::Generators::Base
        source_root File.expand_path('./templates', __FILE__)

        desc 'Creates the default configuration file for Devise::Vero'
        def copy_initializer
          template 'devise_vero.rb', 'config/initializers/devise_vero.rb'
        end
      end
    end
  end
end
