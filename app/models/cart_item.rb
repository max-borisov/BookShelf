class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, presence: true
  validates :user_id, :book_id, numericality: true

  def get_total_price

  end
end
