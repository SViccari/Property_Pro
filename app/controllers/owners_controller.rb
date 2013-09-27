class OwnersController < ApplicationController
  def index
    @owner = Owner.all 
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to owners_path, notice: 'Information has been saved.'
    else
      render :new
    end
  end

 def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html { redirect_to @owner, notice: 'Information was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

 def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy
    respond_to do |format|
      format.html { redirect_to buildings_path }
      format.json { head :no_content}
    end
  end

  protected
  def owner_params
    params.require(:owner).permit(
      :first_name, :last_name, :email, :company_name)
  end 

  def set_owner
    @owner = Owner.find(params[:id])
  end
end