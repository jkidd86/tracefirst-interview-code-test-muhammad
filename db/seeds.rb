[
  { unique_tag: 'ABC1234',  species: 'Domestic Cattle', breed: 'Aberdeen Angus' },
  { unique_tag: 'DEF5678',  species: 'Domestic Cattle', breed: 'Aberdeen Angus' },
  { unique_tag: 'GHI91011', species: 'Domestic Cattle', breed: 'Aberdeen Angus' }
].each do |params|
  unique_tag = params.delete(:unique_tag)
  Animal.find_or_create_by(unique_tag: unique_tag) do |animal|
    animal.name = params[:name]
    animal.species = params[:species]
    animal.breed = params[:breed]
  end
end

[
  { name: 'Alan',     status: 'available',   admin: false, number: '+12345678910' },
  { name: 'Barbara',  status: 'offline',     admin: true,  number: '+441915556666' },
  { name: 'Chaminda', status: 'unavailable', admin: false, number: '+353831112222' },
  { name: 'Dylan',    status: 'available',   admin: false, number: '+10987654321' }
].each do |params|
  name = params.delete(:name)
  Veterinarian.find_or_create_by(name: name) do |veterinarian|
    veterinarian.status = params[:status]
    veterinarian.admin  = params[:admin]
    veterinarian.number = params[:number]
  end
end

TESTS_PER_VET = 100
TEST_RESULTS = %w[Positive Negative Suspect Undetermined]
TESTS = ['Bovine Enteric Disease Panel', 'Bovine Viral Diarrhea', 'Brucella Ovis Elisa']

animals = Animal.all
veterinarians = Veterinarian.all

veterinarians.each do |veterinarian|
  TESTS_PER_VET.times do
    veterinarian.tests.create!(animal: animals.sample,
                               name: TESTS.sample,
                               result: TEST_RESULTS.sample)
  end
end
