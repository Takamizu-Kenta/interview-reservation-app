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
class Interview < ApplicationRecord
  belongs_to :member, primary_key: :id, foreign_key: :member_id
end
