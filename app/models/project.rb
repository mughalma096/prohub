class Project < ApplicationRecord
  # Associations
  has_one_attached :cover
  has_many_attached :images
  has_and_belongs_to_many :technologies

  has_rich_text :description

  # Validations
  validates :name, presence: true, length: { minimum: 5 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :technologies, presence: true

  # Scopes

  # Callbacks

  # Methods

end
