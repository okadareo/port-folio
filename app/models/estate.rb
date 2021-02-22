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

  belongs_to :admin, optional: true
  has_many :favorites, dependent: :destroy
  has_many :researches, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :price, numericality: { only_integer: true }
  validates :floor, presence: true
  validates :info, presence: true, length: { minimum: 30 }
  validates :background_image_id, presence: true
  validates :floor_image_id, presence: true

  def avatar_size
    background_image_id.each do |message|
      if !message.blob.content_type.in?(%('image/jpeg image/png'))
        message.purge
        errors.add(:floor_image_id, 'はjpegまたはpng形式でアップロードしてください')
      end
    end
  end


  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
end
