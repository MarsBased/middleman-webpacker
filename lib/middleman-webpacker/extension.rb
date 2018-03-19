require 'middleman-core'
require 'middleman-webpacker/helpers'

module MiddlemanWebpacker
  class Extension < ::Middleman::Extension

    option :development_webpack_cmd, './node_modules/webpack/bin/webpack.js ' \
      '--watch -d --progress --color --config config/webpack/development.js',
      'command to run webpack in development mode'
    option :production_webpack_cmd, 'NODE_ENV=production ./node_modules/webpack/bin/webpack.js ' \
      '--bail --config config/webpack/production.js',
      'command to run webpack in production mode'
    option :dist_path, 'dist', 'Output directory configured in Webpack'
    option :stylesheets_base_path, '', 'Base path where stylesheets will be placed inside dist_path'
    option :javascripts_base_path, '', 'Base path where javascripts will be placed inside dist_path'
    option :images_base_path, 'img/', 'Base path where images will be placed inside dist_path'

    self.defined_helpers = [MiddlemanWebpacker::Helpers]

    def initialize(app, options_hash = {}, &block)
      super

      output_path = File.join(app.root, options.dist_path)
      Manifest.file_path = File.join(output_path, 'manifest.json')
    end

    def after_configuration
      @app.ignore /stylesheets/
      @app.ignore /javascripts/
      @app.ignore /images/
      @app.ignore /fonts/

      @app.activate :external_pipeline,
        name: :webpack,
        command: @app.build? ? options.production_webpack_cmd : options.development_webpack_cmd,
        source: options.dist_path,
        latency: 1
    end
  end
end
