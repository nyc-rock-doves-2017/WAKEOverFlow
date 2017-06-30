get '/comments' do
  @comments = Comment.all
  erb :'/comments/index'
end

get '/comments/new' do
  @new_comment = Comment.new
  erb :'/comments/new'
end

post '/comments' do
  user = User.find_by(id:7)
  @new_comment = Comment.new(user: user, content:params[:content])
  if @new_comment.save
    redirect '/comments'
  else
   @errors = @new_comment.errors.full_messages
    erb :'comments/new'
  end
end

get '/comments/:id' do
  "Displays a specific comment"
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
