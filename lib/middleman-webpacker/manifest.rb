require 'middleman-webpacker/file_loader'

module MiddlemanWebpacker
  class Manifest < FileLoader

    class_attribute :file_path

    def self.lookup(name)
      load

      unless instance
        raise MiddlemanWebpacker::FileLoader::FileLoaderError.new('load must be called first')
      end

      instance.data[name.to_s] or raise(MiddlemanWebpacker::FileLoader::NotFoundError.new(
        "Can't find #{name} in #{file_path}. Is webpack still compiling?"))
    end

    private

    def load
      return super unless File.exist?(@path)
      JSON.parse(File.read(@path))
    end
  end
end
