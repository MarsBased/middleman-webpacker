module MiddlemanWebpacker
  class FileLoader
    class NotFoundError < StandardError; end
    class FileLoaderError < StandardError; end

    class_attribute :instance
    attr_accessor :data

    def self.load(path = file_path)
      self.instance = new(path)
    end

    private

    def initialize(path)
      @path = path
      @data = load
    end

    def load
      {}.freeze
    end

  end
end
