class Product < ActiveRecord::Base

  def sold_out?
    if self.quantity == 0
      true
    else
      false
    end
  end

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true

end
