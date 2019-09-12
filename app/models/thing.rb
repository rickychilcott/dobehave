class Thing < ApplicationRecord
  TYPES = %w(do be have)
  # For now, don't use STI
  self.inheritance_column = nil

  belongs_to :board

  validates_length_of :summary, in: 3..255

  validates_presence_of :type
  validates_inclusion_of :type, in: TYPES
end
