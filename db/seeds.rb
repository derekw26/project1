User.destroy_all
u1 = User.create :email => 'derek.wei94@gmail.com', :password => 'asdasd', :admin => true

puts "#{ User.count } users created"

Exercise.destroy_all
e1 = Exercise.create :name => 'Bench Press', :equipment => 'Barbell', :body_part => 'Chest, Triceps, Shoulders'
e2 = Exercise.create :name => 'Back Squat', :equipment => 'Barbell', :body_part => 'Legs, Core'
e3 = Exercise.create :name => 'Deadlift', :equipment => 'Barbell', :body_part => 'Legs, Back, Core'
e4 = Exercise.create :name => 'Bicep Curl', :equipment => 'Dumbbell', :body_part => 'Biceps'
e5 = Exercise.create :name => 'Tricep Extension', :equipment => 'Dumbbell', :body_part => 'Triceps'
e6 = Exercise.create :name => 'Shoulder Press', :equipment => 'Dumbbell, Barbell', :body_part => 'Shoulders'
e7 = Exercise.create :name => 'Push Up', :equipment => 'None', :body_part => 'Chest, Triceps, Shoulders'
e8 = Exercise.create :name => 'Sit Up', :equipment => 'None', :body_part => 'Core'
e9 = Exercise.create :name => 'Mountain Climbers', :equipment => 'None', :body_part => 'Core, Legs'
e10 = Exercise.create :name => 'Bird Dog', :equipment => 'None', :body_part => 'Core, Lower Back'
e11 = Exercise.create :name => 'Dead Bug', :equipment => 'None', :body_part => 'Core'
e12 = Exercise.create :name => 'Plank', :equipment => 'None', :body_part => 'Core'

puts "#{ Exercise.count } exercises created"

Workout.destroy_all
w1 = Workout.create :name => 'Compound Lifts', :user_id => 1
w2 = Workout.create :name => 'Arms and Shoulders', :user_id => 1
w3 = Workout.create :name => 'Core Circuit', :user_id => 1

puts "#{ Workout.count } workouts created"

# associations

Round.destroy_all
r1 = Round.create :sets => 5, :reps => 4

w1.rounds << r1
e1.rounds << r1

# w1.exercises << e1 << e2 << e3 << e12
# w2.exercises << e4 << e5 << e6 << e7
# w3.exercises << e7 << e8 << e9 << e10 << e11 << e12
#
# puts "putting exercises into workouts"
