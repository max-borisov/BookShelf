class CartItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, :book_id, presence: true
  validates :user_id, :book_id, numericality: true

  def self.get_total_price(user)
    self.joins(:book).where(user: user).sum(:price)
  end

  def self.get_books_ids(user)
    self.where(user_id: user).pluck(:book_id)
  end

  def self.destroy_books(user)
    self.destroy_all(user: user)
  end
end
