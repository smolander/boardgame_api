class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        
  before_validation :set_provider
  before_validation :set_uid

def set_provider
        self[:provider] = "email" if self[:provider].blank?
end
    
      def set_uid
        self[:uid] = self[:email] if self[:uid].blank? && self[:email].present?
      end
end
