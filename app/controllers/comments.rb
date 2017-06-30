
post '/questions/:id/comments/new' do
  find_user
  @question = Question.find_by(id: params[:id])
  comment = Comment.create(user: @user, commentable: @question, content: params[:content])
  redirect "/questions/#{@question.id}"
end

post '/comments/:id/vote/new' do
  comment = Comment.find_by(id: params[:id])
  find_user
  score = (Vote.where(user: @user, voteable: comment).sum(:score))+params[:score].to_i
  score <= 1 && score >= -1 ? (vote = Vote.create(voteable: comment, user: @user, score: params[:score])) : ()
  if comment.commentable.class == Question
    redirect "/questions/#{comment.commentable.id}"
  else
    redirect "/questions/#{comment.commentable.question.id}"
  end
end
