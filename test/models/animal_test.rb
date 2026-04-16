require "test_helper"

class AnimalTest < ActiveSupport::TestCase

  test 'is invalid with a duplicate unique_tag' do
    Animal.create!(unique_tag: 'ABC123', species: 'Cattle', breed: 'Angus')
    duplicate = Animal.new(unique_tag: 'ABC123', species: 'Cattle', breed: 'Angus')
    assert duplicate.invalid?
    assert_includes duplicate.errors[:unique_tag], 'has already been taken'
  end

  test 'is invalid with a duplicate unique_tag case insensitively' do
    Animal.create!(unique_tag: 'ABC123', species: 'Cattle', breed: 'Angus')
    duplicate = Animal.new(unique_tag: 'abc123', species: 'Cattle', breed: 'Angus')
    assert duplicate.invalid?
    assert_includes duplicate.errors[:unique_tag], 'has already been taken'
  end

end
