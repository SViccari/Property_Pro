class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    @building = Building.all 
  end

  def new
    @building = Building.new
  end

  def edit
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to new_building_path, notice: 'Information has been saved.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: 'Information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @building = Building.find(params[:id])
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_path }
      format.json { head :no_content}
    end
  end

  protected
  def building_params
    params.require(:building).permit(
      :street_address, :city, :state, 
      :postal_code, :description, :owners)
  end 

  def set_building
    @building = Building.find(params[:id])
  end
end
