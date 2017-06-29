get '/users/new' do
  @new_user = User.new
  erb :'/users/new'
end


post '/users' do
  @new_user = User.new(params[:user_information])
  if @new_user.valid?
    create_user
    redirect '/'
  else
    @new_user_errors_messages = @new_user.errors.messages
    erb :'/users/new'
  end
end
