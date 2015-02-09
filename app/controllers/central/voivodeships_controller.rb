class Central::VoivodeshipsController < Central::ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
  end

  def index
  end

  def show
    @voivodeship = Voivodeship.find_by_id(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
