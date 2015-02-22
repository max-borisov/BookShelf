module ReviewsHelper
  def review_belongs_to_user?(review)
    review.user_id == current_user.id
  end
end
