class Central::VoivodeshipsController < Central::ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource

  def new
  end

  def create
  end

  def index
    @voivodeships = Voivodeship.all
  end

  def show
    @voivodeship = Voivodeship.find_by_id(params[:id])
    @committees_votes = Voivodeship.count_votes_for_committees(@voivodeship)
    @number_of_allowed_voters = Voivodeship.count_voters(@voivodeship)
    @all_votes_in_voivodeship = Voivodeship.count_all_votes(@committees_votes, @voivodeship)
    @ballots = Voivodeship.count_all_ballots(@voivodeship)
    @attendance = Voivodeship.count_attendance(@number_of_allowed_voters, @ballots)
    #@voi = @voivodeship.committees.all.inject(0){|s,c| s + c.votes.sum(:number_of_votes) }
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
