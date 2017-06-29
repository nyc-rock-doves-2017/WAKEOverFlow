def update_answer
  @question = Question.find_by(id: params[:id])
  @answer = Answer.find_by(id: params[:id])
  redirect '/questions/#{params[:answer][:question_id]}/answers/#{params[:answer][:answer_id]}'
end
