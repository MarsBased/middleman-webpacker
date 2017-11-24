# Middleman Webpack Extension

This extensions allows to use Webpack in [Middleman](https://middlemanapp.com/) (>= 4) applications through the external pipeline feature introduced in Middleman 4.

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
gem 'middleman-webpack'
```

## Configuration

```
activate :webpack
```

Then you need to provide your Webpack configuration inside the `config` folder. The extension requires to have 2 configuration files:
* `development.js` used during development.
* `production.js` used when building the site.

The extension provides the following configuration options:

`dist_path` (default: 'dist')

Output directory configured in Webpack.

`stylesheets_base_path` (default: '')

Base path where stylesheets will be placed inside dist_path.

`javascripts_base_path` (default: '')

Base path where javascripts will be placed inside dist_path.

`images_base_path` (default: 'img/')

Base path where images will be placed inside dist_path.

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
