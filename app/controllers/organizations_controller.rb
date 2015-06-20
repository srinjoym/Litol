class OrganizationsController < ApplicationController
  # before_action :moreLicenses, only: [:show]
	def new
		@organization = Organization.new
    @organization.users.build
  end
  def create
    @organization = Organization.new(organization_params)
    @organization.numLicenses = 5
    if @organization.save
        log_in @organization.users[0]
        flash[:success] = "Welcome to Project Imagine Dragons!"
        redirect_to @organization
    else
      render 'new'
    end
  end
  def show
    @users = current_user.organization.users
  end

  def newUsers
    @user = User.new
  end

  private

  def organization_params
   params.require(:organization).permit(:organizationName, :licenseKey, :users_attributes => [:name, :email, :password, :password_confirmation])
 end
 def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

  #   # Checks more licenses are available
  # def moreLicenses
  #   current_user.organization.numLicenses-current_user.organization.users.length+1>=3
  # end
end
