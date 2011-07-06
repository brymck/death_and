module DeathAnd
  class Data
    include Enumerable

    class << self
      YAML_PATH = "#{File.dirname(__FILE__)}/data.yml"

      def load
        input = File.new(YAML_PATH, 'r')
        @data = YAML.load(input.read)
        input.close
      end

      def [](index)
        @data[index]
      end

      def each
        @data.each { |datum| yield datum }
      end

      def length
        @data.length
      end
    end
  end
end
