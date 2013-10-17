require 'sinatra'
require 'activerecord'

get '/' do
	erb :index
end

get '/:name' do
	"Hello " + params[:name]
end