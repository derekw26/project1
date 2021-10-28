class RoundsController < ApplicationController

  def get_token
    url = "http://204.235.60.194/consumer/login"
    data = RestClient.post url, {username: "derekexrx", password: "b89Te5ry"}
    obj = JSON.parse data
    $token = {
      string_value: obj['token'],
      time_created: Time.now
    }
    puts obj
  end

  def refresh_token
    if 3500 < Time.now - $token[:time_created]
      get_token
    end
  end

  def search
    refresh_token
    url = "http://204.235.60.194/exrxapi/v1/allinclusive/exercises?" + "apparatus=#{search_params[:apparatus]}" + "&" + "bodypart=#{search_params[:bodypart]}" + "&" "exercisename=#{search_params[:exercisename]}"
    response = RestClient::Request.execute(
      method: :get,
      url: url,
      headers: { :Authorization => ('Bearer ' + $token[:string_value]) }
    )
    return JSON.parse response
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

  def new
    @workout = Workout.find params[:workout_id]
    @round = Round.new
    if params[:search] != nil
      @obj = search
    end
  end

  def create
    @workout = Workout.find params[:workout_id]
    @round = Round.create round_params
    redirect_to edit_workout_path(@workout)
  end

  def edit
    @workout = Workout.find params[:workout_id]
    @round = Round.find params[:id]
    @id_array = []
    @id_array << @round['exercise_id']
    @obj = search_exercise_id
    if params[:search] != nil
      @obj = search
    end
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
  def search_params
    params.require(:search).permit(:apparatus, :exercisename, :bodypart)
  end

  def round_params
    params.require(:round).permit(:exercise_id, :workout_id, :sets, :reps, :time, :weight, :order)
  end
end
