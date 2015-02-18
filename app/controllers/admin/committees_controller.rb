class Admin::CommitteesController < Admin::ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
    @page_title = 'Dodaj nowy komitet'
    @committee = Committee.new
  end

  def create
    @committee = Committee.new(committee_params)
    if @committee.save
      flash[:notice] = 'Komitet został zapisany'
      redirect_to admin_committees_path
    else
      render 'new'
    end

  end

  def index
    @committees = Committee.all
  end

  def edit
    @committee = Committee.set_committee(params)
  end

  def update
    @committee = Committee.set_committee(params)

    if @committee.update(committee_params)
      flash[:notice] = 'Komitet uaktualniony'

      redirect_to admin_committees_path
    else
      render 'new'
    end
  end

  def destroy
    @committee = Committee.set_committee(params)
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

end