class V1::PropertiesController < ApplicationController
  before_action :set_v1_property, only: [:show, :update, :destroy]
  before_action :authenticate

  # GET /v1/properties
  def index
    @v1_properties = V1::Property.where(user_id: current_user).all
    render json: @v1_properties
  end

  # GET /v1/properties/1
  def show
    render json: @v1_property
  end

  # POST /v1/properties
  def create
    @v1_property = V1::Property.new(v1_property_params)
    @v1_property.user_id = current_user
    if @v1_property.save
      render json: @v1_property, status: :created, location: @v1_property
    else
      render json: @v1_property.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /v1/properties/1
  def update
    if @v1_property.update(v1_property_params)
      render json: @v1_property
    else
      render json: @v1_property.errors, status: :unprocessable_entity
    end
  end

  # DELETE /v1/properties/1
  def destroy
    @v1_property.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_v1_property
      @v1_property = V1::Property.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def v1_property_params
      params.require(:v1_property).permit(:title,:description,:state,:post_code,:street_address)
    end
end
