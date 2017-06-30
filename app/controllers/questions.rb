get '/questions' do
  @voteables = sorted_Qs
  erb :'question/index'
end

post '/questions/:id/vote/new' do
  question = Question.find_by(id: params[:id])
  find_user
  score = (Vote.where(user: @user, voteable: question).sum(:score))+params[:score].to_i
  score <= 1 && score >= -1 ? (Vote.create(voteable: question, user: @user, score: params[:score])) : ()
  redirect "/questions/#{question.id}"
end

post '/questions/:id/comments/new' do
  find_user
  @question = Question.find_by(id: params[:id])
  comment = Comment.create(user: @user, commentable: @question, content: params[:content])
  redirect "/questions/#{@question.id}"
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'question/edit'
end

get '/questions/:id' do
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
