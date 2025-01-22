class AdminsController < ApplicationController
    # You can make sure the admin is authenticated
    before_action :authenticate_admin!
  
    # Dashboard view for admins
    def index
      # You can load all businesses for this admin
      @businesses = current_admin.businesses
    end
  
    # Show specific business (optional for now)
    def show
      @business = current_admin.businesses.find(params[:id])
    end
  
    # Edit business (optional for now)
    def edit
      @business = current_admin.businesses.find(params[:id])
    end
  
    # Update business (optional for now)
    def update
      @business = current_admin.businesses.find(params[:id])
      if @business.update(business_params)
        redirect_to admin_dashboard_path, notice: 'Business updated successfully.'
      else
        render :edit
      end
    end
  
    private
  
    # Strong parameters for the business model
    def business_params
      params.require(:business).permit(:name, :address, :contact_info)
    end
  end
  