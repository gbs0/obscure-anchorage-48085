require 'faker'
require 'pry'

Quiz.destroy_all
puts "♻️ Destroyed all Quizzes"
Question.destroy_all
puts "♻️ Destroyed all Questions"
Answear.destroy_all
puts "♻️ Destroyed all Answears"
User.destroy_all
puts "♻️ Destroyed all Users"

puts 'Creating users...'
admin = User.new(id: 1,
            name: "Admin",
            email: "test@test.com",
            password: "p4ssw0rd$",
            admin: true
            )
admin.save!
User.create(id: 2,
    name: "Gabriel Schiavo",
    email: "gabriel.schiavo0@gmail.com",
    password: "p4ssw0rd$"
    )

puts "Creating quizzes..."
    5.times do
        Quiz.create(
            title: "#{Faker::Book.title}",
            user_id: User.last.id,
            topic: Faker::Educator.subject
        )
    end
puts "✅ Done Creating Quizzes!"

puts "Creating questions..."
    i = 1
    while (i < 5)
        5.times do
            Question.create(
                title: "#{Faker::TvShows::Simpsons.quote} ?",
                quiz_id: Quiz.find(i).id,
                user_id: User.last.id    
            )
        end
        i += 1
    end
puts "✅ Done Creating Questions"

puts "Creating Answears..."
    questions = Question.all
    questions.each do |question|
        Answear.create(
            description: Faker::ChuckNorris.fact,
            question_id: question.id,
            lat: Faker::Address.latitude,
            lng: Faker::Address.longitude
        )
    end
puts "✅ Done Creating Answears"