class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :book

  validates :order_id, :book_id, presence: true
  validates :order_id, :book_id, numericality: { only_integer: true }
end
