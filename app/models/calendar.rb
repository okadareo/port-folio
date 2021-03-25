class Calendar < ApplicationRecord
  belongs_to :admin

  validates :title,  presence: true
  validates :body,  presence: true
  validates :start_time,  presence: true
  validates :finish_time,  presence: true
end
