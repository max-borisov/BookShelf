class Book < ActiveRecord::Base
  validates :title, :author, :publisher, :pub_date, :price, :isbn, :description, presence: true
  validates :title, :author, length: { maximum: 150 }
  validates :title, :author, :publisher, length: { maximum: 150 }
  validates :isbn, length: { maximum: 20 }
  validates :amazon_id, length: { maximum: 50 }
  validates :price, numericality: true

  before_save :set_rating_as_zero

  def set_rating_as_zero
    self.rating = 0 if new_record? && rating.nil?
  end
end
