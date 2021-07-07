class Product < ApplicationRecord
  has_one_attached :main_image
  has_many_attached :images

  validates :name, presence: true,
                   length: { minimum: 3,
                             maximum: 45 }
  validates :description, length: { maximum: 255 }
  validates :price_cents, presence: true,
                          numericality: { only_integer: true,
                                          greater_than: 0 }
  validates :cost_cents, presence: true,
                         numericality: { only_integer: true,
                                         greater_than: 0 }
  validates :discount_percentage, presence: true,
                                  numericality: { greater_than_or_equal_to: 0 }
  validates :arts_amount, presence: true,
                          numericality: { only_integer: true,
                                          greater_than_or_equal_to: 0 }

  validate :price_is_greater_than_cost

  def price
    price_cents / 100.0
  end

  def cost
    cost_cents / 100.0
  end

  private

  def price_is_greater_than_cost
    errors.add(:base, I18n.t('some_error')) unless price_cents.to_i > cost_cents.to_i
  end
end
