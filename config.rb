$LOAD_PATH << File.join( Dir.pwd, '/lib' )

Dir["./lib/*"].each { |f| require(f) }

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/img'
set :fonts_dir,  "assets/fonts"

# Bower Components
sprockets.append_path File.join root, 'bower_components'

# ignore '/partials/*'

# Activations
activate :directory_indexes
activate :livereload
activate :autoprefixer
activate :syntax

# Haml
set :haml, ugly:                 true,
           format:               :html5,
           hyphenate_data_attrs: false,
           remove_whitespace:    true

# Markdown
set :markdown, fenced_code_blocks:   true,
               autolink:             true,
               smartypants:          true,
               space_after_headers:  true
set :markdown_engine, :redcarpet

# Helpers
helpers Helpers

# Docs
require  'docs'
activate :docs

# Build-specific configuration
configure :build do

  activate :relative_assets
  set :relative_links, true

  activate :minify_css
  activate :minify_javascript

end
