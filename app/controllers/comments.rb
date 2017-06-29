get '/comments' do
  "displays all comments"
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
  #     puts "Please enter a legitimate comment"
  #   end
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
