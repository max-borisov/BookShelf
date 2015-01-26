class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy

  validates :uid, :total_price, presence: true
  validates :total_price, numericality: true
  validates :uid, numericality: { only_integer: true }

  def save user
    cart = ShoppingCart.new(user)
    cart.checkout
  end

end
