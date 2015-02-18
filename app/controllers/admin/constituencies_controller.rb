class Admin::ConstituenciesController < Admin::ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
    @page_title = 'Dodaj okręg wyborczy'
    @constituency = Constituency.new
  end

  def create
    @constituency = Constituency.new(constituency_params)
    @voivodeship = Constituency.set_voivodeship(@constituency)

    if @constituency.save
      flash[:notice] = 'Okręg utworzony'
      redirect_to admin_voivodeship_constituencies_path(@voivodeship)
    else
      render 'new'
    end
  end

  def index
    @constituencies = Constituency.get_constituencies_from_voivodeship(params[:voivodeship_id])
  end

  def show
  end

  def edit
    @constituency = Constituency.find_by_id(params[:id])
  end

  def update
    @constituency = Constituency.find_by_id(params[:id])
    @voivodeship = Constituency.set_voivodeship(@constituency)


    if @constituency.update(constituency_params)
      flash[:notice] = 'Okręg zaktualizowany'
      redirect_to admin_voivodeship_constituencies_path(@voivodeship)
    else
      render 'new'
    end
  end

  def destroy
    @constituency = Constituency.find_by_id(params[:id])
    @voivodeship = Constituency.set_voivodeship(@constituency)

    @constituency.destroy

    flash[:notice] = 'Okręg usunięty'
    redirect_to admin_voivodeship_constituencies_path(@voivodeship)
  end

  private
  def constituency_params
    params.require(:constituency).permit(
        :name,
        :voivodeship_id,
        :number_of_voters,
        :user_id
    )
  end

end