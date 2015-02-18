class CommitteesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new

  end

  def create

  end

  def index
    @constituency = Committee.set_constituency(@current_user)
    @committees = Committee.find_committees_for_constituency(@current_user)
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
  def committee_params
    params.require(:committee).permit(
        :name,
        :image,
        {:voivodeship_ids => []}
    )
  end

end
