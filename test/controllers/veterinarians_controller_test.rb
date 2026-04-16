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

  test 'should soft delete veterinarian' do
    vet_id = veterinarians(:veterinarian_three).id
    assert_no_difference('Veterinarian.unscoped.count') do
      delete veterinarian_url(veterinarians(:veterinarian_three))
    end
    assert_not_nil Veterinarian.unscoped.find(vet_id).deleted_at
    assert_redirected_to veterinarians_url
  end

  test 'should redirect with message when deleting veterinarian with associated tests' do
    delete veterinarian_url(veterinarians(:veterinarian_one))
    assert_redirected_to veterinarians_url
    assert_equal 'Cannot be deleted while it has associated tests.', flash[:notice]
  end

end
