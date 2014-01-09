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

# Development setting (middleman server)
configure :development do
  activate :google_analytics do |ga|
    ga.tracking_id = false
  end
end

# Build setting
configure :build do
  activate :google_analytics do |ga|
    ga.tracking_id = 'UA-10906036-1'
  end
  activate :minify_html, :remove_quotes => false, :remove_intertag_spaces => true, :remove_script_attributes => true
  activate :minify_css, :ignore => /^\/demo/
  # activate :minify_javascript
end

# Deploy setting
activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
end
