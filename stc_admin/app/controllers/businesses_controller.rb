class BusinessesController < ApplicationController
    before_action :authenticate_admin! # Ensure only logged-in admins can access
    before_action :set_business, only: [:show, :edit, :update, :destroy]
  
    # GET /businesses
    def index
      @businesses = current_admin.businesses
    end
  
    # GET /businesses/:id
    def show
    end
  
    # GET /businesses/new
    def new
      @business = current_admin.businesses.build
    end
  
    # POST /businesses
    def create
      @business = current_admin.businesses.build(business_params)
      if @business.save
        redirect_to @business, notice: 'Business was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # GET /businesses/:id/edit
    def edit
    end
  
    # PATCH/PUT /businesses/:id
    def update
      if @business.update(business_params)
        redirect_to @business, notice: 'Business was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # DELETE /businesses/:id
    def destroy
      @business.destroy
      redirect_to businesses_path, notice: 'Business was successfully deleted.'
    end
  
    private
  
    # Find a business by ID
    def set_business
      @business = current_admin.businesses.find(params[:id])
    end
  
    # Strong parameters for creating/updating businesses
    def business_params
      params.require(:business).permit(:name, :description, :location)
    end
  end
  