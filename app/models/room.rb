class Room < ApplicationRecord
  has_many :messages
  belongs_to :user
  belongs_to :client
  
  validates :client_id, uniqueness: {  scope: :user_id }
end
