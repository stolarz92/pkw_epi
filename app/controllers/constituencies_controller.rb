class ConstituenciesController < ApplicationController
  def new
    @page_title = 'Dodaj okręg wyborczy'
    @constituency = Constituency.new
    @voivodeship = Voivodeship.new
  end

  def create
    @constituency = Constituency.new(constituency_params)
    @constituency.save

    redirect_to constituencies_path
  end

  def index
    @constituencies = Constituency.all
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
  def constituency_params
    params.require(
        :constituency
    ).permit(
        :name,
        :voivodeship_id,
        :number_of_voters
    )
=begin  :number_of_voters,
        :number_of_used_ballots,
        :valid_votes,
        :invalid_votes_no_choice,
        :invalid_votes_more_choices,
        :invalid_votes_other
    )
=end
  end
end
