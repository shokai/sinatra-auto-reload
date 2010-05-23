#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'rack'
#require 'sinatra/auto-reload' if development?
require File.dirname(__FILE__)+'/../lib/sinatra/auto-reload' if development?


get '/' do
  @host = env['HTTP_HOST']
  if development?
    @mes = erb %{
hello world<br />
install <a href="http://<%=@host%>/sinatra_auto_reload.user.js">userscript</a><br />
it automatically reload your web browser
  }
  else
    @mes = 'ruby app.rb -e development<br />or<br />shotgun app.rb'
  end
end



