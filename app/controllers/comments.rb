get '/comments' do
  "displays all comments"
  @comments = Comment.all
  erb :'/comments/index'
end

get '/comments/new' do
  # "Makes new comments"
  erb :'/comments/new'
end

post '/comments' do
  # @comment = Comment.new(params[:comment])
  #   if @comment.save
  #   redirect '/comments'
  #   else
  #     erb :'/comments/new'
  #   end
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
