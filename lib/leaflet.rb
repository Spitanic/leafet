require "leaflet/version"
require "leaflet/view_helpers"
# require "rails"


module Leaflet

  mattr_accessor :tile_layer
  mattr_accessor :attribution
  mattr_accessor :max_zoom
  mattr_accessor :subdomains

  	class Engine < ::Rails::Engine
  		initializer 'leaflet.precompile' do |app|
        if app.config.respond_to? (:assets)
          app.config.assets.precompile += %w(layers-2x.png layers.png marker-icon-2x.png marker-icon.png marker-shadow.png helicopter.png)
        end
      end

      initializer 'leaflet.helpers' do
        ActionView::Base.send :include, Leaflet::ViewHelpers
      end

  	end
end