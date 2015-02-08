class ConstituenciesController < ApplicationController

  before_filter :authenticate_user!

  def new

  end

  def create

  end

  def index
    @constituencies = Constituency.all
  end

  def show
  end

  def edit
    @constituency = Constituency.find_by_id(params[:id])
  end

  def update
    @constituency = Constituency.find_by_id(params[:id])

    if @constituency.update(constituency_params)
      flash[:notice] = 'Okręg zaktualizowany'

      redirect_to constituencies_path
    end
  end

  def destroy
  end

  private
  def constituency_params
    params.require(
        :constituency
    ).permit(
=begin        :name,
        :voivodeship_id,
        :number_of_voters
    )
=end
        :number_of_used_ballots,
        :valid_votes,
        :invalid_votes_no_choice,
        :invalid_votes_more_choices,
        :invalid_votes_other
    )

  end
end
