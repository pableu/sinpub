require 'sinatra'
require 'active_record'

# http://recipes.sinatrarb.com/p/models/active_record?#article

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'sinatra_application.sqlite3.db'
)

get '/' do
	erb :index
end

get '/:name' do
	"Hello " + params[:name]
end