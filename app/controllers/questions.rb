get 'questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new
  erb :'voteable/answers/new'
end

post '/questions/:id/answers/new' do
  answer = Answer.create(user_id: session[:id], question_id: params[:id], content: params[:answer][:content])
  redirect "/questions/#{params[:id]}"
end

get '/questions' do
  @voteables = sorted_Qs
  erb :'question/index'
end

post '/questions/:id/vote/new' do
  question = Question.find_by(id: params[:id])
  find_user
  score = (Vote.where(user: @user, voteable: question).sum(:score))+params[:score].to_i
  score <= 1 && score >= -1 ? (Vote.create(voteable: question, user: @user, score: params[:score])) : ();
  if request.xhr?
    Vote.where(user: @user, voteable: question).sum(:score).to_s
  else
    redirect "/questions/#{question.id}"
  end
end


post '/answers/:id/comment/new' do
  find_user
  answer = Answer.find(params[:id])
  comment = Comment.create(user: @user, commentable: answer, content: params[:content])
  redirect "/questions/#{answer.question.id}"
end

post '/questions/:id/comment/new' do
  find_user
  question = Question.find(params[:id])
  comment = Comment.create(user: @user, commentable: question, content: params[:content])
  redirect "/questions/#{question.id}"
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'question/edit'
end

get '/questions/:id' do
  p "*"*100
  p params
  @question = Question.find_by(id: params[:id])
  @best_answer = Answer.find_by(id: @question.best_answer_id)
  @answers = @question.answers.where.not(id: @question.best_answer_id)
  erb :'question/show'
end


post '/questions' do
  find_user
  question = Question.create(content: params[:content], user: @user)
  redirect "/questions/#{question.id}"
end

put '/questions/:id' do
  question = Question.find_by(id: params[:id])
  if params[:content]
    question.content = params[:content]
  end
  question.best_answer_id = params[:select_best_id]
  question.save
  redirect "/questions/#{question.id}"
end

delete '/questions/:id' do
  Question.destroy(params[:id])
  redirect '/questions'
end
