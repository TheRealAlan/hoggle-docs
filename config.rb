

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'

# Activations
activate :livereload
activate :autoprefixer
activate :syntax

# Configure Markdown
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Build-specific configuration
configure :build do

  activate :relative_assets
  set :relative_links, true

  activate :minify_css
  activate :minify_javascript

end
