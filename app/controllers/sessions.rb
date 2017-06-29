get '/sessions/new' do
  erb :'/sessions/login'
end


post '/sessions/login' do
  login
end


get '/logout' do
  session.clear
  redirect '/sessions/new'
end
