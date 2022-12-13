class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  def approve
    self.status = "Approved"
  end

  def pending?
    status == "Pending"
  end
end