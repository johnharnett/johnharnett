###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

# works with pushstate urls so refresh and saving bookmarks work
["main", "team", "portfolio", "about", "contact"].each do |page|
  proxy "/page/#{page}.html", '/pages_template.html', :locals => { :page_name => page }, :ignore => true
end

# https://github.com/ericam/compass-animation
require "animation"

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :build_dir, "tmp"

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'
set :fonts_dir,  "fonts-folder"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  activate :favicon_maker, :icons => {
      "images/_favicon_template.png" => [
          { icon: "apple-touch-icon-152x152-precomposed.png" },
          { icon: "apple-touch-icon-144x144-precomposed.png" },
          { icon: "apple-touch-icon-120x120-precomposed.png" },
          { icon: "apple-touch-icon-114x114-precomposed.png" },
          { icon: "apple-touch-icon-76x76-precomposed.png" },
          { icon: "apple-touch-icon-72x72-precomposed.png" },
          { icon: "apple-touch-icon-60x60-precomposed.png" },
          { icon: "apple-touch-icon-57x57-precomposed.png" },
          { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
          { icon: "apple-touch-icon.png", size: "57x57" },
          { icon: "favicon-196x196.png" },
          { icon: "favicon-160x160.png" },
          { icon: "favicon-96x96.png" },
          { icon: "favicon-32x32.png" },
          { icon: "favicon-16x16.png" },
          { icon: "favicon.png", size: "16x16" },
          { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
          { icon: "mstile-144x144", format: "png" },
      ]
  }
end
