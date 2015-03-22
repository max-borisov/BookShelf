class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :user_id, :total_price, presence: true
  validates :total_price, numericality: true
  validates :user_id, numericality: { only_integer: true }
end
