# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = [
    {title: 'History'},
    {title: 'Language'}
]

if Category.exists?
    p 'This data is already exist!'
else
    Category.create!(categories)
end

categories_id = Category.all

#-----------------------------------------------------------

tests = [
    {title: 'Vikings', level: 1, category: categories_id[0].id},
    {title: 'English', level: 2, category: categories_id[1].id}
]

if Test.exists?
    p 'This tests data is already exist!'
else
    Test.create!(tests)
end

test_id_val = Test.all

#-----------------------------------------------------------

questions = [
    {body: 'A quiz on the famous Viking king?', test: test_id_val[0].id},
    {body: 'What Language Did the Vikings Speak?', test: test_id_val[0].id},
    {body: 'How often ___ to the dentist?', test: test_id_val[1].id},
    {body: 'How many brothers and sisters ___ ?', test: test_id_val[1].id},
    {body: 'What time ___ pick me up?', test: test_id_val[1].id}
]


if Question.exists?
    p 'This test date is alredy exist'
else
    Question.create!(questions)
end

questions_id_val = Question.all

Answer.create!([
    {body: 'Canute the Great', question: questions_id_val[0].id},
    {body: 'Old Norse', question: questions_id_val[1].id},
    {body: 'do you go', question: questions_id_val[2].id},
    {body: 'have you got', question: questions_id_val[3].id},
    {body: 'can you', question: questions_id_val[4].id}
])

#-----------------------------------------------------------

users = [
    {name: "Mikl", email: "Mikl123@mail.ru", password: '1234567'},
    {name: "Tirion", email: "TiRion9090@mail.ru", password: '123456789'}
]

if User.exists?
    p 'This User data is already exist!'
else
    User.create!(users)
end

user_id_val = User.all

#-----------------------------------------------------------

user_test_val[
    {user_id: user_id_val.id, test_id: test_id_val[0].id},
    {user_id: user_id_val.id, test_id: test_id_val[1].id},
    {user_id: user_id_val.id, test_id: test_id_val[2].id}
]

if UserTest.exists?
    p 'This uesr test data is already exist!'
else
    UserTest.create!(user_test_val)
end