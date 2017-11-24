require 'middleman-core'
require 'middleman-webpack/helpers'

module MiddlemanWebpack
  class Extension < ::Middleman::Extension

    DEVELOPMENT_WEBPACK_CMD = './node_modules/webpack/bin/webpack.js ' \
      '--watch -d --progress --color --config config/webpack/development.js'
    PRODUCTION_WEBPACK_CMD = 'NODE_ENV=production ./node_modules/webpack/bin/webpack.js ' \
      '--bail -p --config config/webpack/production.js'

    option :dist_path, 'dist', 'Output directory configured in Webpack'
    option :stylesheets_base_path, '', 'Base path where stylesheets will be placed inside dist_path'
    option :javascripts_base_path, '', 'Base path where javascripts will be placed inside dist_path'
    option :images_base_path, 'img/', 'Base path where images will be placed inside dist_path'

    self.defined_helpers = [MiddlemanWebpack::Helpers]

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
        command: @app.build? ? PRODUCTION_WEBPACK_CMD : DEVELOPMENT_WEBPACK_CMD,
        source: options.dist_path,
        latency: 1
    end
  end
end
