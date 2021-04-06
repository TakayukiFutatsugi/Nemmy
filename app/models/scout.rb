class Scout < ApplicationRecord
  belongs_to :user
  belongs_to :client
  
  validates :message, presence: true, length: { maximum: 500 }
end
