class Board < ApplicationRecord
  validates :email, presence: true, email: true
end
