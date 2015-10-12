module Jekyll
  module Utils
    class << self
      alias_method :old_slugify, :slugify

      def slugify(string)
        string.gsub(' ', '_')
      end
    end
  end
end
