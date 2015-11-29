require 'digest/sha1'

module Jekyll
  class Document
    alias_method :old_url_placeholders, :url_placeholders

    def url_placeholders
      old_url_placeholders \
        .merge(categories: (data['categories'] || []) \
        .map { |c| Utils.slugify(c.to_s) } \
        .join('/'))
    end

    alias_method :old_id, :id

    def id
      Digest::SHA1.hexdigest(CGI::unescape(url).sub(/\A\//, '').sub(/\/\z/, ''))
    end
  end
end
