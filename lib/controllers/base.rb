require 'sinatra/base'
require 'haml'

class BaseController < Sinatra::Base
  set :views => lambda { "views/#{self.name[0..-11].downcase}" }
  set :haml, :layout => :'/../layout', :format => :html5, :escape_html => true

  before do
    content_type :html, :charset => 'utf-8'
    set :haml, :layout => false if request['X-PJAX']
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end
end
