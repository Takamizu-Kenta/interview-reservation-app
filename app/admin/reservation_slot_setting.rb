ActiveAdmin.register_page "ReservationSlotSettings" do
  menu label: "予約枠管理"

  content title: "予約枠管理" do
    panel "予約枠管理 ※チェックで受付停止" do
      table style: "width:100%;" do
        thead class: "reservation-header" do
          th class: "reservation-day", style: "border-bottom:none;" do
            "日付"
          end
          week_calendar events: reservations do |date|
            th style: "border-bottom:none;"do
              date.day
            end
          end
        end
        tbody class: "calender" do
          week_calendar events: reservations do |reservations|
          end
        end
      end
    end

    panel "予約履歴(日付順)" do
      table_for reservations do
        thead do
          tr do
            %w[日付 時間 名前 学年 学部学科 形式 編集].each &method(:th)
          end
        end
        tbody style: "font-size:16px;" do
          Reservation.where.not(name: "予約停止枠").order(day: :desc).each do |reservation|
            tr do
              td reservation.day
              td reservation.time
              td reservation.name
              td reservation.grade
              td reservation.faculty_department
              td reservation.online_or_offline
              td link_to('編集する', root_path)
            end
          end
        end
      end
    end
  end

  controller do
    def index
      @reservations = Reservation.all
    end

    def open_reservation
      reservation = Reservation.find_by(day: params[:reservation][:day], time: params[:reservation][:time])

      reservation.destroy if reservation
      reservation.save if reservation
    rescue ActiveRecord::RecordInvalid => e
      redirect_to admin_reservationslotsettings_path, flash: { alert: "#{e.message}" }
    end

    def close_reservation
      member = Member.find_or_initialize_by(
        name: "予約停止用",
        email: "admin_user@mail.com",
        faculty_department: "総合政策学部 総合政策学科",
        grade: 2
      )
      member.save

      reservation = Reservation.find_by(day: params[:reservation][:day], time: params[:reservation][:time])

      if reservation.blank?
        member.reservations.create!(
          name: "予約停止枠",
          email: "sample@mitai.com",
          day: params[:reservation][:day],
          time: params[:reservation][:time],
          start_time: params[:reservation][:start_time],
          online_or_offline: "対面",
          reserved: true,
          member_id: member.id,
          member: member
        )
      end
    rescue ActiveRecord::RecordInvalid => e
      redirect_to admin_reservationslotsettings_path, flash: { alert: "#{e.message}" }
    end

    def update
      Reservation.transaction do
        week.each do |day|
          reservation = Reservation.find_by(day: day, time: time)
          if params[:reserved] == true
            reservation ||= Reservation.new(day: day, time: time, reserved: true, member_id: current_member.id)
          else
            reservation.destroy if reservation
          end
          reservation.save
        end
      end
      redirect_to reservations_path
    end
  end
end
