     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'bcrypt'
require_relative 'db/data_access'

also_reload 'db/data_access' if development?

enable :sessions

def logged_in?
  if session[:user_id]
    true 
  else 
    false 
  end 
end 

def current_user() 
  find_user_by_id(session[:user_id])
end 

get '/' do
  posts = run_sql("SELECT * FROM posts;")
  erb :index, locals: {
    posts: posts
  }
end

get '/login' do 
  erb :login, layout: false
end 

post '/signup' do 
  password = BCrypt::Password.create("#{params['password_digest']}")

  create_user(params['name'], params['email'], password)
  redirect '/'
end 

post '/login' do 

end 

get '/posts/new' do 
  erb :new
end 

post '/create' do 
  create_post(params['post_text'], params['image'], params['feeling'], current_user['id'])
  redirect '/'
end 