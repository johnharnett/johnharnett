require 'sinatra'
require 'sinatra/base'
require 'json' # Always handy

class ServerApp < Sinatra::Base

  puts("here")

  # Fall back to this when needed
  set :static, true
  set :public_folder, File.dirname(__FILE__) + '/tmp'

  # Define a form submit route, in POST
  get '/email' do

    puts(params.to_json)
    puts("email linkkkkkk!")
  end
end
