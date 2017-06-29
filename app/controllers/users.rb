get '/users/new' do
  @new_user = User.new
  erb :'/users/new'
end


post '/users' do
  p "*"*100
  @new_user = User.new(params[:user_information])
  if @new_user.valid?
    create_user
    redirect '/users/new'
  else
    erb :'/users/new'
  end
end
