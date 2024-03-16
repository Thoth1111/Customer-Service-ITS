class LandingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :date

  def calendar
    return unless params[:date].present?

    @date = Date.parse(params[:date])
  end

  def update_date
    year = params[:year].to_i
    @date = Date.new(year, @date.month, 1)
    render :calendar
  end

  private

  def set_user
    @user = current_user
  end

  def date
    @date ||= Date.today
  end
end
