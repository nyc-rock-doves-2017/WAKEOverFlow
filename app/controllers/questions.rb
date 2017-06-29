get '/questions/all' do
  @voteables = Question.all
  erb :'questions/index'
end

get '/questions/:id' do
  @voteable = Question.find_by(id: params[:id])
  erb :'questions/show'
end
