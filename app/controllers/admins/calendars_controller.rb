class Admins::CalendarsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @researches = Research.where(status: false)
    @calendar = Calendar.new
    @calendars = Calendar.all
  end

  def create
    @researches = Research.where(status: false)
    @calendar = Calendar.new(calendar_params)
    @calendars = Calendar.all
    if @calendar.save
      flash[:new] = "スケジュール登録が完了されました"
      redirect_to admins_calendars_path
    end
  end

  def show
    @researches = Research.where(status: false)
    @calendar = Calendar.find(params[:id])
    @calendars = Calendar.all
  end

  def update
    @researches = Research.where(status: false)
    @calendar = Calendar.find(params[:id])
    @calendars = Calendar.all
    if @calendar.update(calendar_params)
      flash[:edit] = "スケジュール編集が完了しました"
      redirect_to admins_calendars_path
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    if @calendar.destroy
      flash[:destroy] = "スケジュール削除が完了しました"
      redirect_to admins_calendars_path
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:title, :body, :start_time, :finish_time)
  end
end
