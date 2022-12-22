# Preview all emails at http://localhost:3000/rails/mailers/reservation_confirm_mailer
class ReservationConfirmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reservation_confirm_mailer/complete_reservation
  def complete_reservation
    ReservationConfirmMailer.complete_reservation
  end

end
