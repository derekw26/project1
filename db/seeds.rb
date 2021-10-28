User.destroy_all
u1 = User.create :email => 'derek.wei94@gmail.com', :password => 'asdasd', :admin => true

puts "#{ User.count } users created"

Workout.destroy_all
w1 = Workout.create :name => 'Compound Lifts', :user_id => 1
w2 = Workout.create :name => 'Arms and Shoulders', :user_id => 1
w3 = Workout.create :name => 'Core Circuit', :user_id => 1

puts "#{ Workout.count } workouts created"

# associations

Round.destroy_all
r1 = Round.create :sets => 5, :reps => 4
