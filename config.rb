# Blog settings
Time.zone = 'Tokyo'

require 'lib/helpers'
helpers Helpers

activate :blog do |blog|
  blog.permalink = ":year/:month/:title.html"
  blog.sources = "posts/:year-:month-:day-:title.html"
  blog.layout = "_layouts/post"
  blog.default_extension = ".md"

  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/:num"
end
activate :directory_indexes

# Layout
page "/feed.xml", :layout => false

# Directory
set :css_dir, 'css'
set :js_dir, 'js'
set :layouts_dir, '_layouts'

# Slim
set :slim, { :pretty => true, :sort_attrs => false, :format => :html5 }

# Markdown
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true, :tables => true

# LiveReload
# activate :livereload

# Deploy setting
activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
end

# Build setting
configure :build do
  activate :minify_html, :remove_quotes => false, :remove_intertag_spaces => true
  activate :minify_css, :ignore => /^\/demo/
  # activate :minify_javascript
end
