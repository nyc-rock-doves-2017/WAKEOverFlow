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
   p "^"*100
   p session
   if session[:id]
     @user ||= User.find(session[:id])
   end
 end

 def sorted_Qs
   session[:sort_id] ||= 1

    if session[:sort_id].to_i == 1
      out = Question.all
    elsif session[:sort_id].to_i  == 2
      out = Question.order(updated_at: :asc)
    elsif session[:sort_id].to_i  == 3
      out = Question.order(updated_at: :desc)
    elsif session[:sort_id].to_i  == 4
      out =  Question.joins(:answers, :comments, :votes).select("questions.*, count(*) as total_activity").order("total_activity DESC").group("questions.id")
    elsif session[:sort_id].to_i  == 5
      out = Question.all.sort_by{|q|  q.votes.sum(:score)}.reverse
    else
      out = Question.all
    end
    out
 end


 def best_answer
   best_answer = Answer.find_by(id: @question.best_answer_id)
 end

end
