class WorkoutsController < ApplicationController

  def get_token
    url = "http://204.235.60.194/consumer/login"
    data = RestClient.post url, {username: "derekexrx", password: "b89Te5ry"}
    obj = JSON.parse data
    $token = {
      string_value: obj['token'],
      time_created: Time.now
    }
  end

  def refresh_token
    if 3500 < Time.now - $token[:time_created]
      get_token
    end
  end

  def search_exercise_id
    refresh_token
    url = "http://204.235.60.194/exrxapi/v1/allinclusive/exercises?" + "exerciseids=#{@id_array}"
    response = RestClient::Request.execute(
      method: :get,
      url: url,
      headers: { :Authorization => ('Bearer ' + $token[:string_value]) }
    )
    return JSON.parse response
  end


  def index
      @workouts = @current_user.workouts
  end

  def show
    @workout = Workout.find params[:id]
    @rounds = @workout.rounds
    @id_array = []
    @rounds.each do |round|
      @id_array << round['exercise_id']
    end
    @obj = search_exercise_id
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
    @id_array = []
    @rounds.each do |round|
      @id_array << round['exercise_id']
    end
    @obj = search_exercise_id
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
