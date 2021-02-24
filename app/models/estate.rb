class Estate < ApplicationRecord
  attachment :background_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :floor_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_a, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_b, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_c, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_d, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_e, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_f, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_g, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_h, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_i, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_j, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_k, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  attachment :property_image_l, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  belongs_to :admin, optional: true
  has_many :favorites, dependent: :destroy
  has_many :researches, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :price, numericality: { only_integer: true }
  validates :floor, presence: true, format: { with: /\A[A-Z0-9]+\z/ }
  validates :info, presence: true, length: { minimum: 30 }
  validates :background_image, presence: true
  validates :floor_image, presence: true

  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
