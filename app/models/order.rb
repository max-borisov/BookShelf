class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :user_id, :total_price, presence: true
  validates :total_price, numericality: true
  validates :user_id, numericality: { only_integer: true }

  def attach_books(books_ids)
    books_ids.each { |book_id| order_items.create(book_id: book_id) }
  end
end
