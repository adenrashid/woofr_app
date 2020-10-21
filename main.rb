     
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
  if !logged_in?
    redirect '/login'
  end 

  posts = run_sql("SELECT * FROM posts;")

  erb :index, locals: {
    posts: posts
  }
end

get '/about' do 
  erb :about
end 

get '/login' do 

  if logged_in?
    redirect '/'
  end 

  erb :login
end 

post '/signup' do 
  password = BCrypt::Password.create("#{params['password_digest']}")

  sql = "SELECT * FROM users WHERE email = $1"
  run_sql(sql, [params['email']])

  if run_sql(sql, [params['email']]).to_a == []  
    create_user(params['name'], params['email'], password)
    
    user = find_user_by_email(params['email'])
    session[:user_id] = user['id']
  
    redirect '/'
  else 
    redirect '/login'
    erb :alert
  end 

end 

post '/login' do
  user = find_user_by_email(params['email'])

  if BCrypt::Password.new(user['password_digest']) == (params['password_digest'])
    session[:user_id] = user['id']

    redirect "/"
  else 
    erb :login
  end 
end 

get '/posts/new' do 
  erb :new
end 

post '/create_post' do 
  create_post(params['post_text'], params['image'], params['feeling'], current_user['id'])
  redirect '/'
end 

delete '/logout' do 
  session[:user_id] = nil 
  redirect '/login'
end 

get '/posts/:id' do 
  if !logged_in? 
    redirect '/login'
  end 

  post = find_post_by_id(params['id'])
  user = find_user_by_id(post['user_id'])
  
  erb :details, locals: {
    post: post,
    user: user
  }
end 

get '/posts/:id/edit' do 
  sql = "SELECT * FROM posts WHERE id = $1;"
  results = run_sql(sql, [params['id']])

  erb :edit, locals: {
    post: results[0]
  }
end 

patch '/posts/:id' do 
  sql = "UPDATE posts SET post_text = $1, image = $2, feeling = $3 WHERE id = $4;"
  run_sql(sql, [params["post_text"], params["image"], params["feeling"], params['id']])

  redirect "/posts/#{params['id']}"
end 

delete '/posts/:id' do 
  sql = "DELETE FROM posts WHERE id = $1;"
  run_sql(sql, [params['id']])
  redirect '/'
end 
