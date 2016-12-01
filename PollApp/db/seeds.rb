# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user1 = User.create!(name: 'Zidian')
user2 = User.create!(name: 'SR')
user3 = User.create!(name: 'Joe')

food_poll = Poll.create!(title: 'Favorite Food', author_id: user1.id)
animal_poll = Poll.create!(title: 'Favorite Animal', author_id: user2.id)

fq1 = Question.create!(question_text: 'what is delicious?', poll_id: food_poll.id)
fq2 = Question.create!(question_text: 'How much is it?', poll_id: food_poll.id)

aq1 = Question.create!(question_text: 'what is it?', poll_id: animal_poll.id)
aq2 = Question.create!(question_text: 'Does it fly?', poll_id: animal_poll.id)

aq1_ac1 = AnswerChoice.create!(answer_text: 'It is a chihuahua', question_id: aq1.id)
aq1_ac2 = AnswerChoice.create!(answer_text: 'It is a husky', question_id: aq1.id)
aq2_ac1 = AnswerChoice.create!(answer_text: 'It does not fly', question_id: aq2.id)
aq2_ac2 = AnswerChoice.create!(answer_text: 'It does destroy', question_id: aq2.id)

r1 = Response.create!(user_id: user3.id, answer_id: aq1_ac1.id)
r2 = Response.create!(user_id: user2.id, answer_id: aq1_ac2.id)
