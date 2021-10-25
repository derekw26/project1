class RoundsController < ApplicationController

  def new
    @round = Round.new
    @workout = Workout.find params[:workout_id]
  end

  def create
    @workout = Workout.find params[:workout_id]
    @exercise = Exercise.find params[:exercise_id]
    @round = Round.create round_params
    @round.workout = @workout
    # render :nothing => true
  end

  def edit
    @round = Round.find params[:id]
  end

  def update
    round = Round.find params[:id]
    round.update round_params
    redirect_to round
  end

  def destroy
    round = Round.find params[:id]
    round.destroy
    redirect_to workout_path
  end

  private
  def round_params
    params.require(:round).permit(:exercise_id, :workout_id, :sets, :reps, :time)
  end
end
