module Jekyll
  module Utils
    class << self
      alias_method :old_slugify, :slugify

      def slugify(string, mode: nil, cased: false)
        return nil if string.nil?
        string.gsub(' ', '_')
      end
    end
  end
end
