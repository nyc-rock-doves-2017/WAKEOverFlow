get '/sessions/new' do
  erb :'/sessions/login'
end


post '/sessions/login' do
  login
end


get '/logout' do
  session[:id] = nil
  redirect '/sessions/new'
end

put '/session/sortby' do
  session[:sort_id] = params[:sort_id]
  redirect '/questions'
end
