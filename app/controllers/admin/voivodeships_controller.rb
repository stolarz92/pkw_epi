class Admin::VoivodeshipsController < Admin::ApplicationController
  def new
    @page_title = 'Dodaj nowe województwo'
    @voivodeship = Voivodeship.new
  end

  def create
    @voivodeship = Voivodeship.new(voivodeship_params)
    @voivodeship.save

    redirect_to admin_voivodeships_path
  end

  def index
    @voivodeships = Voivodeship.all
  end

  def show
  end

  def edit
    @voivodeship = Voivodeship.find_by_id(params[:id])
  end

  def update
    @voivodeship = Voivodeship.find_by_id(params[:id])
    if @voivodeship.update(voivodeship_params)
      flash[:notice] = 'Województwo uaktualnione'
      redirect_to admin_voivodeships_path
    else
      render 'new'
    end
  end

  def destroy
    @voivodeship = Voivodeship.find_by_id(params[:id])
    @voivodeship.destroy

    redirect_to admin_voivodeships_path
  end

  private
  def voivodeship_params
    params.require(:voivodeship).permit(:name, :places_regional_council)
  end

end
