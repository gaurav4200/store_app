class User < ApplicationRecord
    enum role: { normal_user: 0, store_owner: 1, system_admin: 2 }
  
    has_many :ratings
    has_many :stores, through: :ratings
  
    validates :name, length: { minimum: 20, maximum: 60 }
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :password, length: { in: 8..16 }, format: { with: /(?=.*[A-Z])(?=.*[\W])/ }
  end
  