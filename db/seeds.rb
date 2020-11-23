# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = Category.create!([
    {title: 'History'},
    {title: 'Language'}
])

tests = Test.create!([
    {title: 'Vikings', level: 1, category: categories[0].id},
    {title: 'English', level: 2, category: categories[1].id}
])

questions = Question.create!([
    {body: 'A quiz on the famous Viking king?', test: tests[0].id},
    {body: 'What Language Did the Vikings Speak?', test: tests[0].id},
    {body: 'How often ___ to the dentist?', test: tests[1].id},
    {body: 'How many brothers and sisters ___ ?', test: tests[1].id},
    {body: 'What time ___ pick me up?', test: tests[1].id}
])

Answer.create!([
    {body: 'Canute the Great', question: questions.first},
    {body: 'Old Norse', question: questions.first},
    {body: 'do you go', question: questions.last},
    {body: 'have you got', question: questions.last},
    {body: 'can you', question: questions.last}
])

users = User.create!([
    {name: "Mikl", email: "Mikl123@mail.ru", password: '1234567'},
    {name: "Tirion", email: "TiRion9090@mail.ru", password: '123456789'}
])

UserTest.create!([
    {user_id: users.id, test_id: tests[0].id},
    {user_id: users.id, test_id: tests[1].id},
    {user_id: users.id, test_id: tests[2].id},
])
