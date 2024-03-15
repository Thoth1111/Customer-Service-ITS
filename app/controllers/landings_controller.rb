class LandingsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def calendar
    @user = current_user
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
