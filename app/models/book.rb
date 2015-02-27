class Book < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  # Case sensitive issue
  scope :search, ->(search, text){ where('title LIKE ?', "%#{text}%") }

  validates :title, :author, :publisher, :pub_date, :price, :isbn, :description, presence: true
  validates :title, :author, length: { maximum: 150 }
  validates :title, :author, :publisher, length: { maximum: 150 }
  validates :isbn, length: { maximum: 20 }
  validates :amazon_id, length: { maximum: 50 }
  validates :isbn, :amazon_id, uniqueness: { message: 'is not unique' }
  validates :price, numericality: true

  # For will_paginate component
  self.per_page = 5
end
