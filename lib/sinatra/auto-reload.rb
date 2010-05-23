require 'rubygems'
require 'sinatra'
require 'sinatra/base'
require 'sinatra/sugar'

module Sinatra

  get '/sinatra_auto_reload' do
    files = [Dir.glob("*"), 
             Dir.glob("*/*"),
             Dir.glob("*/*/*"),
             Dir.glob("*/*/*/*")].flatten

    begin
      auto_reload_ignores.each{|pattern|
        files = files.delete_if{|f| f =~ pattern}
      }
    rescue
    end
    files.map{|f| File::mtime(f).to_i}.sort.last.to_s;
  end

  get '/sinatra_auto_reload.user.js' do # user.js
    @host = env['HTTP_HOST']
    @interval = 1000
    @interval = params[:interval] if params[:interval]
    erb open(File.dirname(__FILE__)+'/views/auto_reload_user_js.erb').read, :layout => false
  end

end
