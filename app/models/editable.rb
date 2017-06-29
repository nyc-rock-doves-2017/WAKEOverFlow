module Editable
  def type_of
    this_class = self.class

    if this_class == Question
      "questions"
    elsif this_class == Answer
      "answers"
    elsif this_class == Comment
      "comments"
    end
  end
end
