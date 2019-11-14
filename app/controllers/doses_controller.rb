class DosesController < ApplicationController
  before_action :set_dose, only: %i[edit update destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @dose.update
      redirect_to cocktail_path
    else
      render :edit
    end
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:name)
  end
end
