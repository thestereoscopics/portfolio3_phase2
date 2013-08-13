enable "sessions"

get '/' do
  unless session[:user] == nil && session[:users] == nil
    users = User.all
    @names = []
      users.each do |user|
        @names << user.name
      end
    @names
    erb :list_users
  else
    erb :index
  end
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

get '/sessions' do
  erb :index
end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  session[:users] = user
  if user
    session[:id] = user.id
  end
  redirect '/'
end

delete '/sessions/:id' do
  session.clear
  erb :index
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  user = User.new(params[:user])
  user.password = params[:password]
  user.save
  session[:user] = user if session[:user] == nil
  redirect "/"
end
