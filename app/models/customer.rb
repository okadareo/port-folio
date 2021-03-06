class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :researches, dependent: :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :phone_number, numericality: true, presence: true, uniqueness: true, format: { with: /\A\d{10,11}\z/ } #ハイフンなしで10・11桁

  enum status: {有効: true, 無効: false}

  def active_for_authentication?
    super && (self.status == "有効")
  end
end
