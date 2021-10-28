class ApiController < ApplicationController
  before_action :check_for_admin, :only => :get_token

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

  def search
  end

  def results
    refresh_token
    url = "http://204.235.60.194/exrxapi/v1/allinclusive/exercises?" + "apparatus=#{query_params[:apparatus]}" + "&" + "bodypart=#{query_params[:bodypart]}" + "&" "exercisename=#{query_params[:exercisename]}"
    response = RestClient::Request.execute(
      method: :get,
      url: url,
      headers: { :Authorization => ('Bearer ' + $token[:string_value]) }
    )
    @obj = JSON.parse response
  end

  private
  def query_params
    params.require(:query).permit(:apparatus, :exercisename, :bodypart)
  end
end
