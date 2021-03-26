class Research < ApplicationRecord
  belongs_to :customer
  belongs_to :estate

  validates :title, presence: :true, length: { minimum: 2 }
  validates :body, presence: :true, length: { minimum: 10 }

  enum status: { 未対応: false, 対応済: true }

  scope :research, -> (search_params) do
    return if search_params.blank?

    name_like(search_params[:name])
      .created_at_from(search_params[:created_at_from])
      .created_at_to(search_params[:created_at_to])
  end

  scope :name_like, -> (name) {
    customer = Customer.where('name LIKE ?', "%#{name}%")
    where(customer_id: customer.ids) if name.present?}
  scope :created_at_from, -> (from) {where('? <= created_at', from) if from.present?}
  scope :created_at_to, -> (to) {where('created_at <= ?', to) if to.present?}
  
end