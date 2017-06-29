10.times do
  users = User.create!( username: Faker::Internet.user_name,
                        email: Faker::Internet.email,
                        password: 'password')
end

20.times do
  questions = Question.create!( content: Faker::Lorem.sentence(1),
                                user: User.all.sample)
end

40.times do
  answers = Answer.create!( content: Faker::Lorem.sentence(2),
                            user: User.all.sample,
                            question: Question.all.sample)
end

80.times do
  comment = Comment.new( content: Faker::Lorem.sentence(1),
                          user: User.all.sample)

  if rand(1..6) <= 3
    comment.commentable = Question.all.sample
  else
    comment.commentable = Answer.all.sample
  end

  comment.save
end

comments = Comment.all

200.times do
  vote = Vote.new( score: (rand(1..2) == 1 ? (-1) : (1)),
                    user: User.all.sample)

  roll = rand(1..9)
  if roll <= 3
    vote.voteable = Question.all.sample
  elsif roll > 3 && roll <= 6
    vote.voteable = Answer.all.sample
  else
    vote.voteable = comments.sample
  end

  vote.save
end
