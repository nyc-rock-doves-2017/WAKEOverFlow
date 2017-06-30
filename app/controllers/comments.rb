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
  @comments = Comment.all
  erb :'/comments/index'
end

get '/comments/new' do
  @new_comment = Comment.new
  erb :'/comments/new'
end

post '/questions/:id/comments' do
  user = User.find_by(id:7)
  @new_comment = Comment.new(user: user, content:params[:content])
  if @new_comment.save
    redirect "/questions/#{params[:id]}"
  else
   @errors = @new_comment.errors.full_messages
    erb :'comments/new'
  end
end

get '/comments/:id' do
  "Displays a specific comment"
  @comment =
  erb :'/comments/show'
end

get '/comments/:id/edit' do
  "Form for editing comments"
  erb :'/comments/edit'
end

put '/comments/:id' do
  "updates a comment"
  erb :'/comments/edit'
end

delete '/comments/:id' do
  "deletes a comments"
  redirect '/comments'
end
