class UpdatePasswordForm < ActiveRecord::Base
# class UpdatePasswordForm < ActiveForm
  attr_accessor :current_password
  has_secure_password
  validates :password, length: { minimum: 5 }


end
