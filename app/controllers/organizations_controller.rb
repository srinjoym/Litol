class OrganizationsController < ApplicationController

	def new
		@organization = Organization.new
    @organization.users.build
	end
	def create
		@organization = Organization.new(organization_params)
		if @organization.save
      # log_in @organization
      # @organization.clearance = 3
      # @organization.save
      flash[:success] = "Welcome to Project Imagine Dragons!"
      # redirect_to @organization
  else
      # render 'new'
  end
end 
private

def organization_params
	params.require(:organization).permit(:organizationName, :licenseKey)
end
end
