class WorkoutsController < ApplicationController

  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find params[:id]
  end

  def new
    @workout = Workout.new
  end

  def create
    workout = Workout.create workout_params
    @current_user.workouts << workout
    redirect_to edit_workout_path(workout)
  end

  def edit
    @workout = Workout.find params[:id]
    @rounds = @workout.rounds
  end

  def update
    workout = Workout.find params[:id]
    workout.update workout_params
    redirect_to workout
  end

  def destroy
    workout = Workout.find params[:id]
    workout.destroy
    redirect_to workouts_path
  end

  private
  def workout_params
    params.require(:workout).permit(:name)
  end
end
