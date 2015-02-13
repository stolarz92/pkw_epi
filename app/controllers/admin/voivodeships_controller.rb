class Admin::VoivodeshipsController < Admin::ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
    @page_title = 'Dodaj nowe województwo'
  end

  def create
    @voivodeship = Voivodeship.new(voivodeship_params)
    @voivodeship.save

    redirect_to admin_voivodeships_path
  end

  def index
    @voivodeships = Voivodeship.all
  end

  def voivodeships_index
    @voivodeships = Voivodeship.all
  end

  def edit
    @voivodeship = Voivodeship.set_voivodeship(params)
  end

  def update
    @voivodeship = Voivodeship.set_voivodeship(params)
    if @voivodeship.update(voivodeship_params)
      flash[:notice] = 'Województwo uaktualnione'
      redirect_to admin_voivodeships_path
    else
      render 'new'
    end
  end

  def destroy
    @voivodeship = Voivodeship.set_voivodeship(params)
    @voivodeship.destroy

    redirect_to admin_voivodeships_path
  end

  private
  def voivodeship_params
    params.require(:voivodeship).permit(:name, :places_regional_council)
  end

end
