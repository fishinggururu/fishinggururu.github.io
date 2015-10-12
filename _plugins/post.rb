module Jekyll
  class Post
    alias_method :old_url_placeholders, :url_placeholders

    def url_placeholders
      old_url_placeholders.merge(categories: (categories || []).map { |c| Utils.slugify(c.to_s) }.join('/'))
    end
  end
end
