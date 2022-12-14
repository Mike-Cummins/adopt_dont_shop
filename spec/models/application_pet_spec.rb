require 'rails_helper'

RSpec.describe ApplicationPet do
  it {should belong_to :pet}
  it {should belong_to :application}

  it 'checks to see if the status is pending' do 
    shelter = Shelter.create!(name: "Brightside", city: "Salem", rank: 2, foster_program: true)
    pet_1 = shelter.pets.create!(name: "Bobby", age: 2, breed: 'Bulldog', adoptable: true)
    application_1 = Application.create!(name: 'Billy Bob', street_address: "54984 Bulldog Rd", city: "Salem", state: "OR", zipcode: "97301", description: "Billy Bob wants a buddy", status: "Pending")
    app_pet = ApplicationPet.create!(pet: pet_1, application: application_1)

    expect(app_pet.pending?).to eq(true)
  end
end