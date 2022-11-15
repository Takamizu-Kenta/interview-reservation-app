# == Schema Information
#
# Table name: reservations
#
#  id                :bigint           not null, primary key
#  affiliation       :string
#  confirm_password  :string
#  day               :date
#  email             :string
#  name              :string
#  online_or_offline :string
#  start_time        :datetime
#  time              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_reservations_on_email  (email) UNIQUE
#
require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
