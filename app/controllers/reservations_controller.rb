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
    member = Member.find_or_initialize_by(member_params)
    member.save
    binding.pry
    @reservation = member.reservations.create!(
      name: params[:reservation][:name],
      email: params[:reservation][:email],
      faculty_department: params[:reservation][:faculty_department],
      grade: params[:reservation][:grade],
      online_or_offline: params[:reservation][:online_or_offline],
      day: params[:reservation][:day],
      time: params[:reservation][:time],
      start_time: params[:reservation][:start_time],
      member_id: member.id,
      member: member
    )
    if @reservation.present?
      flash[:notice] = "面談予約が完了しました。"
      redirect_to root_path
    else
      redirect_to new_reservation_path(reservation_params), flash: { alert: "必須項目を正しく入力してください。" }
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      flash[:notice] = "面談予約の更新が完了しました。"
      redirect_to root_path
    else
      redirect_to new_reservation_path(reservation_params), flash: { alert: "予約の更新に失敗しました。再度お試しください。" }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      flash[:notice] = "面談予約を削除しました。"
      redirect_to root_path
    else
      redirect_to confirm_reservations_path(reservation_params), flash: { alert: "削除に失敗しました。再度お試しください" }
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:name, :email, :faculty_department, :grade, :online_or_offline, :day, :time, :start_time)
  end

  def member_params
    { name: reservation_params[:name], email: reservation_params[:email], faculty_department: reservation_params[:faculty_department], grade: reservation_params[:grade] }
  end
end
