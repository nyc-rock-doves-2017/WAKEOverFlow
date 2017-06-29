get '/answers' do
  @voteables = Answer.all
  erb :'voteables/index'
end

get 'questions/:id/answers/new' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.new
  erb :'voteable/answers/new'
end

post '/questions/:id/answers/new' do
  answer = Answer.create(params[:answer])
  redirect '/questions/#{params[:answer][:question_id]}/answers/#{params[:answer][:answer_id]}'
end

get '/questions/:id/answers/:id' do
  @question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(id: params[:id])
  # may need 
  erb :'voteable/answers/show'
end

patch '/questions/:id/answers/:id' do
  update_answer
end

put '/questions/:id/answers/:id' do
  update_answer
end

delete '/questions/:id/answers/:id' do
  Answer.find_by(id: params[:id]).destroy
  redirect '/questions/:id'
  # this redirect needs to be updated
end
