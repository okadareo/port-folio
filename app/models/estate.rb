class Estate < ApplicationRecord
  attachment :background_image
  attachment :floor_image
  attachment :property_image_a
  attachment :property_image_b
  attachment :property_image_c
  attachment :property_image_d
  attachment :property_image_e
  attachment :property_image_f
  attachment :property_image_g
  attachment :property_image_h
  attachment :property_image_i
  attachment :property_image_j
  attachment :property_image_k
  attachment :property_image_l
  attachment :property_image_m
  attachment :property_image_n
  attachment :property_image_o

  belongs_to :admin, optional: true
  has_many :favorites, dependent: :destroy
  has_many :researches, dependent: :destroy

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
