class ReservationConfirmMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_confirm_mailer.complete_reservation.subject
  #
  def complete_reservation(member, reservation)
    @member = member
    @reservation = reservation

    mail(:subject => "面談予約完了のお知らせ", to: member.email)
  end
end
