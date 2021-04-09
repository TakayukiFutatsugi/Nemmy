class Room < ApplicationRecord
  has_many :messages
  belongs_to :user
  belongs_to :client
end
