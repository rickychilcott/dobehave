class Board < ApplicationRecord
  has_many :things

  validates :email, presence: true, email: true
end
