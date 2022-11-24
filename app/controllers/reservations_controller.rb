class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end

  def new
    @reservation = Reservation.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    
    message = Reservation.check_reservation_day(@day.to_date)
    if !!message
      redirect_to @reservation, flash: { alert: message }
    end
  end

  def confirm
    @search = Reservation.ransack(params[:q])
    @reservation =
    if params[:q].blank? || params[:q][:email_eq] == ""
      Reservation.none
    else
      @search.result
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "面談予約が完了しました。"
      redirect_to root_path
    else
      redirect_to new_reservation_path(reservation_params), flash: { alert: "必須項目を正しく入力してください。" }
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :email, :affiliation, :online_or_offline, :day, :time, :user_id, :start_time, :confirm_password)
  end
end
