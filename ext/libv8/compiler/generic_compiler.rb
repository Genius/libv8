module Libv8
  module Compiler
    class GenericCompiler
      VERSION_REGEXP = /(\d+\.\d+(\.\d+)*)/
      TARGET_REGEXP = /Target: ([a-z0-9\-_.]*)/

      def initialize(path)
        @path = path
      end

      def name
        File.basename @path
      end

      def to_s
        @path
      end

      def version
        call('-v') =~ VERSION_REGEXP
        $1
      end

      def target
        call('-v') =~ TARGET_REGEXP
        $1
      end

      def compatible?
        false
      end

      def call(*arguments)
        `#{arguments.unshift('LC_ALL=en', @path).join(' ')}`
      end
    end
  end
end
