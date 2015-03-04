include ActionView::Helpers::SanitizeHelper

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  before_save :sanitize_html

  validates :text, presence: true

  protected
    def sanitize_html
      self.text = sanitize text, tags: ['"', "'"]
    end
end
