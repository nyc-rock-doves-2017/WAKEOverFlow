# get 'questions/:id/answers' do
#   @voteables = Answer.all
#   erb :'voteables/index'
# end

get 'questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new
  erb :'voteable/answers/new'
end

post '/questions/:id/answers/new' do
  answer = Answer.create(user_id: session[:id], question_id: params[:id], content: params[:answer][:content])
  redirect "/questions/#{params[:id]}"
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
