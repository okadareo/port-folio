class Calendar < ApplicationRecord
  belongs_to :admin

  validates :title,  presence: true
  validates :start_time,  presence: true
  validates :finish_time,  presence: true
  validate :start_finish_check

  def start_finish_check
    return if start_time.blank? && finish_time.blank?

    if start_time > finish_time
      errors.add(:finish_time, "が開始日時より前の日付では登録できません。")
    end
  end
end
