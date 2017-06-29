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
