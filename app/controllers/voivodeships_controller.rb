class VoivodeshipsController < ApplicationController

  before_filter :authenticate_user!

  def new

  end

  def create

  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
  def voivodeship_params
    params.require(:voivodeship).permit(:name, :places_regional_council)
  end

end
