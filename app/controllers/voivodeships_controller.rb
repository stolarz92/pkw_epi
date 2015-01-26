class VoivodeshipsController < ApplicationController
  def new
    @page_title = 'Dodaj nowe województwo'
    @voivodeship = Voivodeship.new
  end

  def create
    @voivodeship = Voivodeship.new(voivodeship_params)
    @voivodeship.save

    redirect_to voivodeships_path
  end

  def index
    @voivodeships = Voivodeship.all
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
