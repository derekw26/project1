User.destroy_all
u1 = User.create :email => 'derek.wei94@gmail.com', :password => 'asdasd', :admin => true

puts "#{ User.count } users created"

Workout.destroy_all
w1 = Workout.create :name => 'Compound Lifts', :user_id => u1.id
w2 = Workout.create :name => 'Arms and Shoulders', :user_id => u1.id
w3 = Workout.create :name => 'Core Circuit', :user_id => u1.id

puts "#{ Workout.count } workouts created"

# associations

Round.destroy_all
