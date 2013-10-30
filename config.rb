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

page "/feed.xml", :layout => false

set :layouts_dir, '_layouts'
set :css_dir, 'css'
set :js_dir, 'js'
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true

# activate :livereload

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'master'
end
