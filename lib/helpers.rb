module Helpers

  def current_page_slug
    if current_resource.url == http_prefix
      "root"
    else
      current_resource.url.gsub("#{http_prefix}", '').gsub("/", '')
    end
  end

end