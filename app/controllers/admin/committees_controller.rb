class Admin::CommitteesController < Admin::ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
    @page_title = 'Dodaj nowy komitet'
    @committee = Committee.new
  end

  def create
    @committee = Committee.new(committee_params)
    @committee.save

    redirect_to admin_committees_path
  end

  def index
    @committees = Committee.all
  end

  def edit
    @committee = set_committee
  end

  def update
    @committee = set_committee

    if @committee.update(committee_params)
      flash[:notice] = 'Komitet uaktualniony'

      redirect_to admin_committees_path
    else
      render 'new'
    end
  end

  def destroy
    @committee = set_committee
    @committee.destroy

    flash[:notice] = 'Komitet został usunięty'
    redirect_to admin_committees_path
  end

  private
  def committee_params
    params.require(:committee).permit(
        :name,
        :image,
        {:voivodeship_ids => []}
    )
  end

  def set_committee
    Committee.find_by_id(params[:id])
  end

end