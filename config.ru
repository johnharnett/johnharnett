require "rubygems"

require "rack"
require "middleman/rack"
require "rack/contrib/try_static"
# require './serverapp'
#
# use ServerApp

# Build the static site when the app boots
`bundle exec middleman build`

# Enable proper HEAD responses
use Rack::Head
# Attempt to serve static HTML files
use Rack::TryStatic,
    :root => "tmp",                                     # static files root dir
    :urls => %w[/],                                     # match all requests
    :try => ['.html', 'index.html', '/index.html']      # try these postfixes sequentially

# Serve a 404 page if all else fails
run lambda { |env|
  [
      404,
      {
          "Content-Type"  => "text/html",
          "Cache-Control" => "public, max-age=60"
      },
      File.open("tmp/404/index.html", File::RDONLY)
  ]
}
