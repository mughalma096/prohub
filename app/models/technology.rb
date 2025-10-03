class Technology < ApplicationRecord

  # Associations
  has_one_attached :logo
  has_and_belongs_to_many :projects

  # Validations
  validates :name, presence: true, length: { minimum: 3 }

  # Scopes

  # Callbacks

end
