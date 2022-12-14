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
class Member < ApplicationRecord
  has_many :interviews, primary_key: :id, foreign_key: :member_id, dependent: :destroy
  has_many :reservations, primary_key: :id, foreign_key: :member_id, dependent: :destroy

  enum faculty_department: {
    "総合政策学部 総合政策学科": 1,
    "総合政策学部 企業経営学科": 2,
    "外国語学部 英語学科": 3,
    "外国語学部 観光交流文化学科": 4,
    "外国語学部 中国語学科": 5,
    "保健学部 臨床検査技術学科": 6,
    "保健学部 健康福祉学科": 7,
    "保健学部 作業療法学科": 8,
    "保健学部 理学療法学科": 9,
    "保健学部 臨床工学科": 10,
    "保健学部 臨床心理学科": 11,
    "保健学部 看護学科 看護学専攻": 12,
    "保健学部 看護学科 教育学専攻": 13,
    "保健学部 診療放射線技術学科": 14
  }
  enum grade: {
    "1年": 1,
    "2年": 2,
    "3年": 3,
    "4年": 4
  }
  enum status: {
    "継続中": 1,
    "休部": 2,
    "退部": 3
  }
end
