class Central::ConstituenciesController < Central::ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
  end

  def index
  end

  def show
    @constituency = Constituency.find_by_id(params[:id])
    @committees_votes = Constituency.count_votes_for_committees(@constituency)
    @ballots = @constituency.number_of_used_ballots
  end

  def edit
  end

  def update
  end

  def destroy
  end
end