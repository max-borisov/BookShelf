class Book < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  before_save :set_keywords

  # For will_paginate component
  self.per_page = 5

  # Case sensitive issue
  scope :search, ->(keywords){ where( 'keywords ILIKE :keywords', {keywords: "%#{keywords}%"} ) if keywords.present? }

  validates :title, :author, :publisher, :pub_date, :price, :isbn, :description, presence: true
  validates :title, :author, length: { maximum: 150 }
  validates :title, :author, :publisher, length: { maximum: 150 }
  validates :isbn, length: { maximum: 10 }
  validates :amazon_id, length: { maximum: 50 }
  validates :isbn, :amazon_id, uniqueness: { message: 'is not unique' }
  validates :price, numericality: true

  def set_keywords
    self.keywords = [title, author, isbn, amazon_id].join(' ')
  end

end
