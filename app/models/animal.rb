class Animal < ApplicationRecord
  has_many :tests, dependent: :restrict_with_exception
  # As Animal tags are case insensitive identifiers. ABC123 and abc123 are the same tag.
  validates :unique_tag, uniqueness: { case_sensitive: false }
end
