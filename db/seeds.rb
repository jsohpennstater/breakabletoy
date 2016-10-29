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

# Questionnaire.create(title: "Sleep Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")
# Questionnaire.create(title: "Depression Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")
# Questionnaire.create(title: "Anxiety Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")
# Questionnaire.create(title: "Substance Use Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")
# Questionnaire.create(title: "Repetitive Thoughts and Behaviors Questionnaire", physician_name: "Dr.Freud", clinic_address: "100 Memory Lane", clinic_phone: "123-456-7890")


Question.create(content: "In the past seven days, my sleep was restless.", questionnaire_id: 1)
Question.create(content: "In the past seven days, I was satisfied with my sleep.", questionnaire_id: 1, reverse: true)
Question.create(content: "In the past seven days, my sleep was refreshing.", questionnaire_id: 1, reverse: true)
Question.create(content: "In the past seven days, I had difficulty falling asleep.", questionnaire_id: 1)
Question.create(content: "In the past seven days, I had trouble staying sleeping.", questionnaire_id: 1)
Question.create(content: "In the past seven days, I had trouble sleeping.", questionnaire_id: 1)
Question.create(content: "In the past seven days, I got enough sleep.", questionnaire_id: 1, reverse: true)
Question.create(content: "In the past seven days, my sleep quality was very poor.", questionnaire_id: 1, reverse: true)


Question.create(content: "In the past seven days, I felt worthless.", questionnaire_id: 2)
Question.create(content: "In the past seven days, I felt that I had nothing to look forward to.", questionnaire_id: 2)
Question.create(content: "In the past seven days, I felt helpless.", questionnaire_id: 2)
Question.create(content: "In the past seven days, I felt sad.", questionnaire_id: 2)
Question.create(content: "In the past seven days, I felt like a failure.", questionnaire_id: 2)
Question.create(content: "In the past seven days, I felt depressed.", questionnaire_id: 2)
Question.create(content: "In the past seven days, I felt unhappy.", questionnaire_id: 2)
Question.create(content: "In the past seven days, I felt hopeless.", questionnaire_id: 2)


Question.create(content: "In the past seven days, I felt fearful.", questionnaire_id: 3)
Question.create(content: "In the past seven days, I felt anxious", questionnaire_id: 3)
Question.create(content: "In the past seven days, I felt worried.", questionnaire_id: 3)
Question.create(content: "In the past seven days, I found it hard to focus on anything other than my anxiety.", questionnaire_id: 3)
Question.create(content: "In the past seven days, I felt nervous.", questionnaire_id: 3)
Question.create(content: "In the past seven days, I felt uneasy.", questionnaire_id: 3)
Question.create(content: "In the past seven days, I felt tense.", questionnaire_id: 3)


# Question.create(content: "I felt fearful.", questionnaire_id: 3)
# Question.create(content: "I felt anxious", questionnaire_id: 3)
# Question.create(content: "I felt worried.", questionnaire_id: 3)
# Question.create(content: "I found it hard to focus on anything other than my anxiety.", questionnaire_id: 3)
# Question.create(content: "I felt nervous.", questionnaire_id: 3)
# Question.create(content: "I felt uneasy.", questionnaire_id: 3)
# Question.create(content: "I felt tense.", questionnaire_id: 3)

# Question.create(content: "On average, how much time is occupied by these thoughts or behaviors each day?", questionnaire_id: 4)
# Question.create(content: "How much distress do these thoughts or behaviors cause you?", questionnaire_id: 4)
# Question.create(content: "How hard is it for you to control these thoughts or behaviors?", questionnaire_id: 4)
# Question.create(content: "How much do these thoughts or behaviors cause you to avoid doing anything, going anyplace, or being with anyone?", questionnaire_id: 4)
# Question.create(content: "How much do these thoughts or behaviors interfere with school, work, or your social or family life?", questionnaire_id: 4)

# Assignment.create(user_id: 2, questionnaire_id: 1)
Assignment.create(user_id: 2, questionnaire_id: 2)
Assignment.create(user_id: 2, questionnaire_id: 3)

Assignment.create(user_id: 3, questionnaire_id: 1)
Assignment.create(user_id: 3, questionnaire_id: 2)
Assignment.create(user_id: 3, questionnaire_id: 3)

Assignment.create(user_id: 4, questionnaire_id: 1)
Assignment.create(user_id: 4, questionnaire_id: 2)
Assignment.create(user_id: 4, questionnaire_id: 3)

Assignment.create(user_id: 5, questionnaire_id: 1)
Assignment.create(user_id: 5, questionnaire_id: 2)
Assignment.create(user_id: 5, questionnaire_id: 3)
