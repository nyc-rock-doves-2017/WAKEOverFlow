post '/answers/:id/vote/new' do
  answer = Answer.find_by(id: params[:id])
  find_user
  score = (Vote.where(user: @user, voteable: answer).sum(:score))+params[:score].to_i
  score <= 1 && score >= -1 ? (vote = Vote.create(voteable: answer, user: @user, score: params[:score])) : ()
  redirect "/questions/#{answer.question.id}"
end

post '/answers/:id/comments/new' do
  find_user
  @answer = Answer.find_by(id: params[:id])
  comment = Comment.create(user: @user, commentable: @answer, content: params[:content])
  redirect "/questions/#{@answer.question.id}"
end

get '/answers/:id/edit' do
  @answer = Answer.find_by(id: params[:id])
  erb :'answers/edit'
end

patch '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @answer.content = params[:answer][:content]
  @answer.save
  redirect "/questions/#{@answer.question_id}"
end

put '/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  @answer.content = params[:answer][:content]
  @answer.save
  redirect "/questions/#{@answer.question_id}"
end

delete '/answers/:id' do
  answer = Answer.find_by(id: params[:id])
  Answer.destroy(params[:id])
  redirect "/questions/#{answer.question_id}"
  # this redirect needs to be updated
end
