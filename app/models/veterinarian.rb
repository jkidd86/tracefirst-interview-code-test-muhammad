class Veterinarian < ApplicationRecord
  has_many :tests, dependent: :restrict_with_exception

  def destroy
    raise ActiveRecord::DeleteRestrictionError.new(:tests) if tests.any?
    update(deleted_at: Time.current)
  end

end
