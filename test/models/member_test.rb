# == Schema Information
#
# Table name: members
#
#  id                           :bigint           not null, primary key
#  email                        :string
#  faculty_department(学部学科) :integer
#  generation(期)               :integer
#  grade(学年)                  :integer
#  name                         :string
#  name_furigana                :string
#  position(役職)               :string
#  status(ステータス)           :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
# Indexes
#
#  index_members_on_email  (email) UNIQUE
#
require "test_helper"

class MemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
