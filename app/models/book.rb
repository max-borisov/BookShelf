class Book < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  validates :title, :author, :publisher, :pub_date, :price, :isbn, :description, presence: true
  validates :title, :author, length: { maximum: 150 }
  validates :title, :author, :publisher, length: { maximum: 150 }
  validates :isbn, length: { maximum: 20 }
  validates :amazon_id, length: { maximum: 50 }
  validates :price, numericality: true
end
