helpers do
  def create_user
   @user = User.new(params[:user_information])
   @user.password = params[:user_information][:password]
   @user.save!
 end
 def login
   @user = User.find_by(username: params[:user_information][:username])
   if @user && @user.password == params[:user_information][:password]
      session[:id] = @user.id
      redirect '/'
   else
     # make an error message here
      redirect '/sessions/new'
    end
 end
 def logged_in?
   !!@user
 end
 def find_user
   if session[:id]
     @user ||= User.find(session[:id])
   end
 end

end
