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

#-----------------------------------------------------------

tests = [
    {title: 'Vikings', level: 1, category: categories[0].id},
    {title: 'English', level: 2, category: categories[1].id}
]

test_id_val = nil

if Test.exists?
    p 'This tests data is already exist!'
else
    test_id_val = Test.create!(tests)
end

#-----------------------------------------------------------

questions = [
    {body: 'A quiz on the famous Viking king?', test: test_id_val[0].id},
    {body: 'What Language Did the Vikings Speak?', test: test_id_val[0].id},
    {body: 'How often ___ to the dentist?', test: test_id_val[1].id},
    {body: 'How many brothers and sisters ___ ?', test: test_id_val[1].id},
    {body: 'What time ___ pick me up?', test: test_id_val[1].id}
]

questions_id_val = nil

if Question.exists?
    p 'This test date is alredy exist'
else
    questions_id_val = Question.create!(questions)
end

Answer.create!([
    {body: 'Canute the Great', question: questions.first},
    {body: 'Old Norse', question: questions.first},
    {body: 'do you go', question: questions.last},
    {body: 'have you got', question: questions.last},
    {body: 'can you', question: questions.last}
])

#-----------------------------------------------------------

users = [
    {name: "Mikl", email: "Mikl123@mail.ru", password: '1234567'},
    {name: "Tirion", email: "TiRion9090@mail.ru", password: '123456789'}
]

user_id_val = nil

if User.exists?
    p 'This User data is already exist!'
else
    user_id_val = User.create!(users)
end

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


