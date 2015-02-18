class ConstituenciesController < ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new

  end

  def create

  end

  def index
    @constituency = Constituency.where(:user_id => current_user.id).to_a
    @votes_number = Constituency.count_votes(@constituency)
  end

  def show
  end

  def edit
    @constituency = set_constituency
  end

  def update
    @constituency = set_constituency

    if @constituency.update(constituency_params)
      flash[:notice] = 'Okręg zaktualizowany'
      redirect_to constituencies_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def constituency_params
    params.require(
        :constituency
    ).permit(
        :number_of_used_ballots,
        :valid_votes,
        :invalid_votes_no_choice,
        :invalid_votes_more_choices,
        :invalid_votes_other
    )

  end

  def set_constituency
    Constituency.find_by_id(params[:id])
  end
end
