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
	@posts = Post.all
	erb :index
end

get '/new' do
	erb :new
end

post '/new' do
	post = Post.new
	post.name = params[:post][:title]
	post.body = params[:post][:content]
	post.save
	redirect '/'
end

get '/posts/:id' do 
	@post = Post.find(params[:id])
	erb :post
end

get '/:name' do
	"Hello " + params[:name]
end