class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  attachment :profile_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
         
  has_many :favorites, dependent: :destroy
  has_many :researches, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :phone_number, numericality: true, presence: true, uniqueness: true, format: { with: /\A\d{10,11}\z/ } #ハイフンなしで10・11桁

  enum status: { 有効: true, 無効: false }

  def active_for_authentication?
    super && (self.status == "有効")
  end
  
  scope :research, -> (search_params) do
    return if search_params.blank?
    
    name_like(search_params[:name])
      .phone_number_like(search_params[:phone_number])
  end
  
  scope :name_like, -> (name) {where('name LIKE ?', "%#{name}%") if name.present?}
  scope :phone_number_like, -> (phone_number) {where('phone_number LIKE ?', "%#{phone_number}%") if phone_number.present?}
  
end
