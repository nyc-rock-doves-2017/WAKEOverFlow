get '/questions' do
  # delete meeeee
  session[:id] = 1
  @voteables = Question.all
  erb :'question/index'
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'question/edit'
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @answers = @question.answers
  erb :'question/show'
end


post '/questions' do
  find_user
  question = Question.create(content: params[:content], user: @user)
  redirect "/questions/#{question.id}"
end

put '/questions/:id' do
  question = Question.find_by(id: params[:id])
  question.content = params[:content]
  question.save
  redirect "/questions/#{question.id}"
end

delete '/questions/:id' do
  Question.destroy(params[:id])
  redirect '/questions'
end
