class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pets = @application.pets 
    if params[:search].present?
      @search_pets = Pet.search(params[:search]) 
    end    
  end

  def new 
  end 

  def create
    @application = Application.new(application_params)
    if @application.save
      redirect_to "/applications/#{@application.id}"
    else 
      redirect_to "/applications/new"
      flash[:notice] = @application.errors.full_messages.to_sentence
    end 
  end

  def update
    application = Application.find(params[:id])
    if params[:pet]
      new_pet = Pet.find(params[:pet])
      ApplicationPet.create(pet: new_pet, application: application)
      application.update(application_params)
    elsif
      params[:description]
      application.update(application_params)
    end
    redirect_to "/applications/#{application.id}"
  end 

  private
  def application_params
    params.permit(:name, :street_address, :city, :state, :zipcode, :description, :status)
  end
end