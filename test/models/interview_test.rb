# == Schema Information
#
# Table name: interviews
#
#  id                :bigint           not null, primary key
#  interview_content :text
#  interview_date    :datetime
#  interviewer       :string
#  member            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  member_id         :integer
#
require "test_helper"

class InterviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
