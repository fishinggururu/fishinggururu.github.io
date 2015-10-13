module Jekyll
  class CategoryRedirector < Generator
    safe true

    def generate(site)
      site.data['category_urls'].each do |url|
        redirect_page = JekyllRedirectFrom::RedirectPage.new(site, site.source, '', '')
        redirect_page.data['permalink'] = url['old']
        redirect_page.data['sitemap'] = false
        redirect_page.generate_redirect_content(url['new'])
        site.pages << redirect_page
      end
    end
  end
end
