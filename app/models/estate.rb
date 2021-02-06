class Estate < ApplicationRecord
  attachment :background_image
  attachment :floor_image
  attachment :property_image

  belongs_to :admin
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
