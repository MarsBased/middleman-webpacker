require 'middleman-webpacker/manifest'

module MiddlemanWebpacker
  module Helpers

    def stylesheet_pack_tag(name, **options)
      stylesheet_link_tag(Manifest.lookup("#{extension_options.stylesheets_base_path}#{name}.css"), **options)
    end

    def javascript_pack_tag(name, **options)
      javascript_include_tag(Manifest.lookup("#{extension_options.javascripts_base_path}#{name}.js"), **options)
    end

    def image_pack_tag(name, **options)
      image_tag(Manifest.lookup("#{extension_options.images_base_path}#{name}"), **options)
    end

    def asset_pack_path(name, **options)
      asset_path(Manifest.lookup(name), **options)
    end

    def manifest_resource_path(name)
      Manifest.lookup(name)
    end

    private

    def extension_options
      app.extensions[:webpack].options
    end

  end
end
