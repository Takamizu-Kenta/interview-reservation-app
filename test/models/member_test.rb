# == Schema Information
#
# Table name: members
#
#  id                           :bigint           not null, primary key
#  faculty_department(学部学科) :string
#  generation(期)               :integer
#  grade(学年)                  :integer
#  name                         :string
#  name_furigana                :string
#  position(役職)               :string
#  status(ステータス)           :string
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
require "test_helper"

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
