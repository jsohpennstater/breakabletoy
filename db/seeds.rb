# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# admin = User.create(first_name: "Sigmund", last_name: "Freud", username: "psychoanalysis", email: "psychoanalysis@gmail.com", password: 'sixchar1', admin: true)
# user1 = User.create(first_name: "Jane", last_name: "Doe", username: "janedoe", email: "janedoe@gmail.com", password: 'sixchar1')
# user2 = User.create(first_name: "John", last_name: "Smith", username: "johnsmith", email: "johnsmith@gmail.com", password: 'sixchar1')
# user2 = User.create(first_name: "Charlie", last_name: "Kelly", username: "charliekelly", email: "charliekelly@gmail.com", password: 'sixchar1')
# user2 = User.create(first_name: "Sarah", last_name: "Wood", username: "sarahwood", email: "sarahwood@gmail.com", password: 'sixchar1')
#

# Less than 55 = None to slight
# 55.0—59.9 = Mild
# 60.0—69.9 = Moderate
# 70 and over = Severe
#
#
# t_score = (score.to_i * 8) / (5.to_i)

Questionnaire.create(title: "Sleep Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")
Questionnaire.create(title: "Depression Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")
Questionnaire.create(title: "Anxiety Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")
Questionnaire.create(title: "Substance Use Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")
Questionnaire.create(title: "Repetitive Thoughts and Behaviors Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")

#
# Question.create(que)
# 1. My sleep was restless. (5)
# 2. I was satisfied with my sleep. (5)(r)
# 3. My sleep was refreshing (5)(r)
# 4. I had difficulty falling asleep. (5)
# 5. I had trouble staying asleep. (4)
# 6. I had trouble sleeping. (5)
# 7. I got enough sleep. (4)(r)
# 9. My sleep quality was very poor. (5)(r)
