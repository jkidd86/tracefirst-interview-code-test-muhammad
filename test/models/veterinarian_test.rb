require "test_helper"

class VeterinarianTest < ActiveSupport::TestCase
  def build_vet(number)
    Veterinarian.new(name: "Dr. Test", status: "available", admin: false, number: number)
  end

  # Valid numbers
  test "accepts valid E.164 number with country code" do
    assert build_vet("+14155552671").valid?
  end

  # Invalid numbers
  test "rejects number without leading +" do
    vet = build_vet("14155552671")
    assert vet.invalid?
    assert_includes vet.errors[:number], I18n.t("activerecord.errors.models.veterinarian.attributes.number.invalid")
  end
end