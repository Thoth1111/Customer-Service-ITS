class LandingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_date

  def calendar
    if params[:date].present?
      @date = Date.parse(params[:date])
    end
  end

  def update_date
   year = params[:year].to_i
   @date = Date.new(year, @date.month, 1)
   render :calendar
  end

  private

  def set_user_date
    @user = current_user
    @date ||= Date.today
  end
end
