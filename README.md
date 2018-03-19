# Middleman Webpacker Extension

This extensions allows to use Webpack in [Middleman](https://middlemanapp.com/) (>= 4) applications through the external pipeline feature introduced in Middleman 4.

It's heavily inspired in the Webpacker gem for Rails.

## Dependencies

* Middleman >= 4

## Installation

If you're just getting started, install the middleman gem and generate a new project:

```
gem install middleman
middleman init MY_PROJECT
```

If you already have a Middleman project: Add this to the Gemfile and run `bundle install`

```
gem 'middleman-webpacker'
```

## Configuration

```
activate :webpack
```

Then you need to provide your Webpack configuration inside the `config` folder. The extension requires to have 2 configuration files:
* `development.js` used during development.
* `production.js` used when building the site.

The extension provides the following configuration options:

* `development_webpack_cmd`
(default: './node_modules/webpack/bin/webpack.js --watch -d --progress --color --config config/webpack/development.js')\
command to run webpack in development mode

* `production_webpack_cmd`
(default: 'NODE_ENV=production ./node_modules/webpack/bin/webpack.js --bail --config config/webpack/production.js')\
command to run webpack in production mode

* `dist_path` (default: 'dist')\
Output directory configured in Webpack.

* `stylesheets_base_path` (default: '')\
Base path where stylesheets will be placed inside dist_path.

* `javascripts_base_path` (default: '')\
Base path where javascripts will be placed inside dist_path.

* `images_base_path` (default: 'img/')\
Base path where images will be placed inside dist_path.

### Manifest

In order for the plugin to work, you need to add the `ManifestPlugin` to the Webpack config.

Add the `webpack-manifest-plugin` package to `package.json`. Then in the Webpack config file.

```
// Require the plugin at the top
const ManifestPlugin = require('webpack-manifest-plugin');

...

// Add the plugin to the plugins section
plugins: [
  new ManifestPlugin({
    publicPath: '/',
    writeToFileEmit: true
  })
]
```

## Usage

When activating the extension, Webpack will be used with the provided configuration. The extension is configured to have Webpack take care of all assets: Javascript, stylesheets, images and fonts.

This means that all of these assets need to be covered in your Webpack configuration.

In order to be able to use the assets compiled by Webpack from the HTML you can use the following helpers:
* `javascript_pack_tag` which replaces `javascript_include_tag`
* `stylesheet_pack_tag` which replaces `stylesheet_link_tag`
* `image_pack_tag` which replaces `image_tag`
* `asset_pack_path` which replaces `asset_path`

## TODO

1. Provide a base Webpack configuration (a la webpacker)
