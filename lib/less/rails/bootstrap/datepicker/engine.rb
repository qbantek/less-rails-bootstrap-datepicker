require 'rails'

module Less
  module Rails
    module Bootstrap
      module Datepicker
        class Engine < ::Rails::Engine
          initializer 'less-rails-bootstrap-datepicker.setup', :after => 'less-rails.before.load_config_initializers', :group => :all do |app|
            app.config.less.paths << File.join(config.root, 'app', 'frameworks')
          end
        end
      end
    end
  end
end