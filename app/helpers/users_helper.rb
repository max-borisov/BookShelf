module UsersHelper
  def user_gravatar email
    'http://www.gravatar.com/avatar/' + Digest::MD5.hexdigest(email) + '?s=200'
  end
end
