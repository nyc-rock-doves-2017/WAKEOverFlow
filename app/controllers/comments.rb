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

get '/comments' do
  "displays all comments"
end

get '/comments/new' do
  # "Makes new comments"
  erb :'/comments'
end

post '/comments' do
end

get '/comments/:id' do
  "Displays a specific comment"
end

get '/comments/:id/edit' do
  "Form for editing comments"
end

put '/comments/:id' do
  "updates a comment"
end

delete '/comments/:id' do
  "deletes a comments"
end
