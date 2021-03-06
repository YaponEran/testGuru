# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = [
  {title: 'Nature'},
  {title: 'Sport'}
]

if Category.exists?
  p 'This data is already exist!'
else
  Category.create!(categories)
  p 'The Category data is inserted!'
end

categories_id = Category.all

#-----------------------------------------------------------

users = [
  {first_name: "Mikl", email: "Mikl123@mail.ru", password: '1234567'},
  {first_name: "Tirion", email: "TiRion9090@mail.ru", password: '123456789'},
  {first_name: "Laoshi", email:"lao123@gmail.com", password:'12qwaszxalp'}
]

if User.exists?
  p 'This User data is already exist!'
else
  User.create!(users)
end

user_id_val = User.all


#-----------------------------------------------------------

tests = [
  {title: 'Trees', level: 1, category: categories_id[0], author: user_id_val[1]},
  {title: 'Cyber Sport', level: 1, category: categories_id[1], author: user_id_val[1]}
]

if Test.exists?
  p 'This tests data is already exist!'
else
  Test.create!(tests)
  p "The Test data is inserted!"
end

test_id_val = Test.all

#-----------------------------------------------------------

questions = [
  {body: 'What the name of the biggest in the world?', test: test_id_val[0]},
  {body: 'When relaised the firts Cyber sport games?', test: test_id_val[1]},
  {body: 'Which game is popular in game Sport?', test: test_id_val[1]},
  ]


if Question.exists?
  p 'This test date is alredy exist'
else
  Question.create!(questions)
  p "The Question data is inserted"
end

questions_id_val = Question.all

#-----------------------------------------------------------

answers = [
  {body: "Red Sicwoys", correct: true, question: questions_id_val[0]},
  {body: "In Japan 2011", correct: true, question: questions_id_val[1]},
  {body: "World of Warcraft", correct: true, question: questions_id_val[1]},
]

if Answer.exists?
  p "The answer data is already exists"
else
  Answer.create!(answers)
  p "The Answer data is inserted!"
end

#-----------------------------------------------------------
