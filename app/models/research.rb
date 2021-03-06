class Research < ApplicationRecord
  belongs_to :customer
  belongs_to :estate

  validates :title, presence: :true, length: { minimum: 2 }
  validates :body, presence: :true, length: { minimum: 10 }

  enum status: {未対応: false, 対応済: true }

  def self.search(name, create)
    if name.present? && create.present?
      # Research.where("created_at LIKE?", "%#{create}%")
      # logger.debug("aaa")
      customer = Customer.where("name LIKE?", "%#{name}%")
      logger.debug(customer.ids)
      logger.debug("aaa")
      # Research.where(customer_id: customer.ids, created_at: date )
      Research.where(['created_at LIKE? OR customer_id LIKE?', "%#{create}%", [customer.ids]])
    elsif create.present?

    else
      @researches = Research.all
    end
  end
end
