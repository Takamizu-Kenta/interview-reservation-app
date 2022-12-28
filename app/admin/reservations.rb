ActiveAdmin.register Reservation do
  permit_params :name, :faculty_department, :day, :time, :start_time, :online_or_offline, :email

  controller do
    def create
      require 'zoom'

      member = Member.find_or_initialize_by(member_params)
      member.save

      meeting_url = zoom()

      reservation = member.reservations.create!(
        name: params[:reservation][:name],
        email: params[:reservation][:email],
        faculty_department: params[:reservation][:faculty_department],
        grade: params[:reservation][:grade],
        online_or_offline: params[:reservation][:online_or_offline],
        day: params[:reservation][:day],
        time: params[:reservation][:time],
        start_time: params[:reservation][:start_time],
        meeting_url: meeting_url,
        reserved: true,
        member_id: member.id,
        member: member
      )
      if reservation.present?
        ReservationConfirmMailer.complete_reservation(member, reservation).deliver

        flash[:notice] = "面談予約が完了しました。登録して頂いたメールアドレス宛に確認メールを送信しましたので、合わせてご確認ください。"
        redirect_to admin_reservations_path
      end
    rescue ActiveRecord::RecordInvalid => e
      redirect_to new_admin_reservation_path(reservation_params), flash: { alert: "必須項目を正しく入力してください。" }
    rescue => e
      redirect_to new_admin_reservation_path(reservation_params), flash: { alert: "#{e.message}" }
    end

    def edit
      @reservation = Reservation.find(params[:id])
    end

    def update
      @reservation = Reservation.find(params[:id])
      if @reservation.update(reservation_params)
        flash[:notice] = "面談予約の更新が完了しました。"
        redirect_to admin_reservations_path
      else
        redirect_to new_admin_reservation_path(reservation_params), flash: { alert: "予約の更新に失敗しました。再度お試しください。" }
      end
    end

    def destroy
      @reservation = Reservation.find(params[:id])
      if @reservation.destroy
        flash[:notice] = "面談予約を削除しました。"
        redirect_to admin_reservations_path
      else
        redirect_to comfirm_admin_reservation_path(reservation_params), flash: { alert: "削除に失敗しました。再度お試しください" }
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

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :faculty_department
    column :online_or_offline
    column :day
    column :time
    actions
  end

  show do
    attributes_table do
      row :member
      row :email
      row :faculty_department
      row :online_or_offline
      row :day
      row :time
      row :meeting_url
      row :updated_at
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :faculty_department, as: :select, collection: Member.faculty_departments.keys
      f.input :grade, as: :select, collection: Member.grades.keys
      f.input :online_or_offline
      f.input :day, as: :date_picker
      f.input :time, as: :time_picker
      f.input :meeting_url
    end
    f.actions
  end

  filter :email
  filter :faculty_department
  filter :online_or_offline
  filter :created_at
end
