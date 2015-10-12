module Jekyll
  class Post
    alias_method :old_url_placeholders, :url_placeholders

    def url_placeholders
      old_url_placeholders.merge(categories: (categories || []).map { |c| Utils.slugify(c.to_s) }.join('/'))
    end

    alias_method :old_id, :id

    def id
      CGI::unescape(url).sub(/\A\//, '').sub(/\/\z/, '')
    end
  end
end
