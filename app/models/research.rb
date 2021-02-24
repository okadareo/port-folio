class Research < ApplicationRecord
  belongs_to :customer
  belongs_to :estate
  
  validates :title, presence: :true, length: { minimum: 10 }
  validates :body, presence: :true, length: { minimum: 30 }
end
