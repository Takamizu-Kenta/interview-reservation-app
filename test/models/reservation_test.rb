# == Schema Information
#
# Table name: reservations
#
#  id                          :bigint           not null, primary key
#  day                         :date
#  email                       :string
#  faculty_department          :string
#  grade                       :integer
#  meeting_url                 :string
#  name                        :string
#  online_or_offline(実施形式) :integer
#  start_time                  :datetime
#  time                        :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  member_id                   :integer
#
require "test_helper"

class ReservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
