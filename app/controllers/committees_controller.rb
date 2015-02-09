class CommitteesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  private
  def committee_params
    params.require(:committee).permit(
        :name,
        :image,
        {:voivodeship_ids => []}
    )
  end

  def new

  end

  def create

  end

  def index
    @committee = Committee.find_by_id(params[:id])
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
