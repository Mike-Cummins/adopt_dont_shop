require 'rails_helper'

RSpec.describe Application do
  it {should have_many(:pets).through(:application_pets)}
  it { should have_many :application_pets}
end