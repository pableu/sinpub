require 'sinatra'
require 'active_record'

# http://recipes.sinatrarb.com/p/models/active_record?#article
# http://www.millwoodonline.co.uk/blog/sinatra-activerecord-postgres-application

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'sinatra_application.sqlite3.db'
)

class Post < ActiveRecord::Base
end

get '/' do
	erb :index
end

get '/new' do
	erb :new
end

post '/new' do
	puts params.inspect
	post = Post.new
	post.name = params[:post][:title]
	post.body = params[:post][:content]
	post.save
end

get '/:name' do
	"Hello " + params[:name]
end