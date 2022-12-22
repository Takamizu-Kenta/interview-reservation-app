require "test_helper"

class ReservationConfirmMailerTest < ActionMailer::TestCase
  test "complete_reservation" do
    mail = ReservationConfirmMailer.complete_reservation
    assert_equal "Complete reservation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
