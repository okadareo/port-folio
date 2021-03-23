class Admins::CalendarsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @researches = Research.where(status: false)
    @calendar = Calendar.new
    @calendars = Calendar.all
    @i = 1
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  def create
    calendar = Calendar.new(calendar_params)
    if calendar.save
      redirect_to admins_calendars_path
    end
  end

  def update
    calendar = Calendar.find(params[:id])
    if calendar.update(calendar_params)
      redirect_to admins_calendars_path
    else
      render 'edit'
    end
  end

  def destroy
    calendar = Calendar.find(params[:id])
    if calendar.destroy
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :body, :start_time, :finish_time)
  end
end
