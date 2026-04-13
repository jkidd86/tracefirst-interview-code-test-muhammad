require 'test_helper'

class VeterinariansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @veterinarian = veterinarians(:veterinarian_one)
  end

  test 'should get index' do
    get veterinarians_url
    assert_response :success
  end

  test 'should get new' do
    get new_veterinarian_url
    assert_response :success
  end

  test 'should create veterinarian' do
    assert_difference('Veterinarian.count') do
      post veterinarians_url, params: { veterinarian: { name: 'Karl',
                                                        status: 'available',
                                                        admin: false,
                                                        number: '+09876589365' } }
    end

    assert_redirected_to veterinarian_url(Veterinarian.last)
  end

  test 'should show veterinarian' do
    get veterinarian_url(@veterinarian)
    assert_response :success
  end

  test 'should get edit' do
    get edit_veterinarian_url(@veterinarian)
    assert_response :success
  end

  test 'should update veterinarian' do
    patch veterinarian_url(@veterinarian), params: { veterinarian: { name: 'Karl',
                                                                     status: 'unavailable',
                                                                     admin: false,
                                                                     number: '+09876989365' } }
    assert_redirected_to veterinarian_url(@veterinarian)
  end

  test 'should destroy veterinarian' do
    assert_difference('Veterinarian.count', -1) do
      delete veterinarian_url(veterinarians(:veterinarian_two))
    end

    assert_redirected_to veterinarians_url
  end
end
