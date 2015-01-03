class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, 
         :rememberable, :trackable, :validatable
end

# How to remove signup and forgot password pages.
# http://stackoverflow.com/questions/23009363/rails-devise-gem-remove-sign-up-and-forgot-password-modules
