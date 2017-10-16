require 'sinatra'
require 'sqlite3'
require 'active_record'
require 'json'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./db/bbs.db"
)

class Comment < ActiveRecord::Base
end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @comments = Comment.order('id desc')
  erb :index
end

post '/comment' do

  Comment.create({
    body: params[:body],
    user_name: params[:user_name]
  })

end

get '/comments/last' do
  comment = Comment.last
  {body: comment.body, user_name: comment.user_name}.to_json
end
