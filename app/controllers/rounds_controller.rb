class RoundsController < ApplicationController

  def new
    @round = Round.new
    @workout = Workout.find params[:workout_id]
  end

  def create
    @workout = Workout.find params[:workout_id]
    @exercise = Exercise.find params[:round][:exercise_id]
    @round = Round.create round_params
    redirect_to edit_workout_path(@workout)
  end

  def edit
    @round = Round.find params[:id]
    @workout = Workout.find params[:workout_id]
  end

  def update
    round = Round.find params[:id]
    round.update round_params
    redirect_to edit_workout_path(params[:workout_id])
  end

  def destroy
    round = Round.find params[:id]
    round.destroy
    redirect_to edit_workout_path(params[:workout_id])
  end

  private
  def round_params
    params.require(:round).permit(:exercise_id, :workout_id, :sets, :reps, :time)
  end
end
