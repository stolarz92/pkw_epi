class Admin::ConstituenciesController < Admin::ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
    @page_title = 'Dodaj okręg wyborczy'
    @constituency = Constituency.new
  end

  def create
    @constituency = Constituency.new(constituency_params)
    @constituency.save

    redirect_to admin_constituencies_path
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

      redirect_to admin_constituencies_path
    else
      render 'new'
    end
  end

  def destroy
    @constituency = Constituency.find_by_id(params[:id])
    @constituency.destroy

    flash[:notice] = 'Okręg usunięty'
    redirect_to admin_constituencies_path
  end

  private
  def constituency_params
    params.require(
        :constituency
    ).permit(
        :name,
        :voivodeship_id,
        :number_of_voters,
        :user_id
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