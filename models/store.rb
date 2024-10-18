# app/models/store.rb
class Store < ApplicationRecord
    has_many :ratings
    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  
    validates :name, presence: true
    validates :address, length: { maximum: 400 }
  end
  