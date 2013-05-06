require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/appdb.db")

  class Post
    include DataMapper::Resource
    property :id, Serial
    property :title, String
    property :body, Text
    property :created_at, DateTime
  end    

DataMapper.finalize.auto_upgrade!

get '/' do
    # get the latest 20 posts
    @posts = Post.all(:order => [ :id.desc ], :limit => 20)
    erb :index
end

get '/view' do  
  erb :view  
end

post '/view' do  
  params[:comment]
end 