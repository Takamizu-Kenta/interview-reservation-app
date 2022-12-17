# == Schema Information
#
# Table name: reservations
#
#  id                          :bigint           not null, primary key
#  day                         :date
#  email                       :string
#  faculty_department          :string
#  grade                       :integer
#  name                        :string
#  online_or_offline(実施形式) :integer
#  start_time                  :datetime
#  time                        :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  member_id                   :integer
#

class Reservation < ApplicationRecord
  validate :date_before_start
  validate :date_current_today
  validate :date_three_month_end
  validates :email, { presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } }
  validates :name, presence: true
  validates :online_or_offline, presence: true

  belongs_to :member, primary_key: :id, foreign_key: :member_id, optional: true

  enum online_or_offline: {
    "選択してください": 0,
    "対面": 1,
    "オンライン": 2
  }, _prefix: true

  def date_before_start
    errors.add(:day, "は過去の日付は選択できません。予約画面から正しい日付を選択してください。") if day < Date.current
  end

  def date_current_today
    errors.add(:day, "は当日は選択できません。予約画面から正しい日付を選択してください。") if day < (Date.current + 1)
  end

  def date_three_month_end
    errors.add(:day, "は3ヶ月以降の日付は選択できません。予約画面から正しい日付を選択してください。") if (Date.current >> 3) < day
  end


  def self.reservations_after_three_month
    # 今日から3ヶ月先までのデータを取得
    reservations = Reservation.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    # 配列を作成し、データを格納
    reservation_data = []
    reservations.each do |reservation|
      reservations_hash = {}
      reservations_hash.merge!(day: reservation.day.strftime("%Y-%m-%d"), time: reservation.time)
      reservation_data.push(reservations_hash)
    end
    reservation_data
  end

  def self.check_reservation_day(day)
    if day < Date.current
      return "過去の日付は選択できません。正しい日付を選択してください。"
    elsif day < (Date.current + 1)
      return "当日は選択できません。正しい日付を選択してください。"
    elsif (Date.current >> 3) < day
      return "3ヶ月以降の日付は選択できません。正しい日付を選択してください。"
    end
  end
end
