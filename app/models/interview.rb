# == Schema Information
#
# Table name: interviews
#
#  id                :bigint           not null, primary key
#  interview_content :text
#  interview_date    :datetime
#  interview_date       :string
#  member            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Interview < ApplicationRecord
end
