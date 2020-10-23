     
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

  erb :login, locals: {
    display_error: false,
    display_blank_error: false,
    login_error: false
  }
end 

post '/signup' do 
  password = BCrypt::Password.create("#{params['password_digest']}")
  sql = "SELECT * FROM users WHERE email = $1"
  run_sql(sql, [params['email']])

  if params['name'] == '' || params['email'] == '' || password == ''
    
    blank_fields_error = 'Error: You cannot leave a field empty'

    erb :login, locals: {
      display_blank_error: true, 
      display_error: false,
      login_error: false,
      blank_fields_error: blank_fields_error
    }
  elsif run_sql(sql, [params['email']]).to_a == []  
    create_user(params['name'], params['email'], password)
    
    user = find_user_by_email(params['email'])
    session[:user_id] = user['id']
  
    redirect '/'
  else 
    error_message = 'Error: This email is already in use'

    erb :login, locals: {
      display_error: true, 
      display_blank_error: false,
      login_error: false,
      error_message: error_message
    }
  end 

end 

post '/login' do
  sql = "SELECT * FROM users WHERE email = $1"
  run_sql(sql, [params['email']])

  if params['email'] == '' || params['password'] == '' || run_sql(sql, [params['email']]).to_a == []

    login_error = "Error: Account not found"

    erb :login, locals: {
      display_blank_error: false, 
      display_error: false,
      login_error: login_error
    }
  elsif BCrypt::Password.new(find_user_by_email(params['email'])['password_digest']) == (params['password_digest'])
    session[:user_id] = find_user_by_email(params['email'])['id']

    redirect "/"
  else 
    erb :login, locals: {
      display_blank_error: false, 
      display_error: false,
      login_error: login_error
    }
  end 
end 

get '/posts/new' do 
  erb :new
end 

post '/posts' do 
  create_post(params['post_text'], params['image'], params['feeling'], current_user['id'], params['date_created'], params['time_created'])
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
  comments = run_sql("SELECT * FROM comments WHERE post_id = #{params['id']};")
  
  erb :details, locals: {
    post: post,
    user: user, 
    comments: comments
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

post '/comment/:id' do 
  create_comment(current_user['id'], params['id'], params['comment'])
  redirect "/posts/#{params['id']}"
end 

get '/profile/:id' do 
  user = current_user()

  erb :profile, locals: {
    user: user,
    display_error: false 
  }
end 

patch '/profile/:id' do 
  user = current_user()

  if params["name"] == '' || params["email"] == '' || params["icon"] == '' || params['bio'] == '' || params['location'] == '' 
    'hello'

    error_message = 'Error: Field cannot be left blank'

    erb :profile, locals: {
      user: user,
      display_error: true,
      error_message: error_message
    }

  else 
    sql = "UPDATE users SET name = $1, email = $2, icon = $3, bio = $4, location = $5 WHERE id = $6;"
    run_sql(sql, [params["name"], params["email"], params["icon"], params['bio'], params['location'], params['id']])  

    redirect "/profile/#{params['id']}"
  end 
end 

get '/comment/:id/edit' do 
  sql = "SELECT * FROM comments WHERE id = $1;"
  results = run_sql(sql, [params['id']])

  erb :edit_comment, locals: {
    comment: results[0]
  }
end 

patch '/comment/:id' do 
  sql = "UPDATE comments SET comment = $1 WHERE id = $2;"
  run_sql(sql, [params["comment"], params["id"]])

  post_id = find_comment_by_id(params["id"])["post_id"]
  redirect "/posts/#{post_id}"
end 

delete '/comment/:id' do 
  sql = "DELETE FROM comments WHERE id = $1;"
  run_sql(sql, [params['id']])
  
  redirect "/"
end 