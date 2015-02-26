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
    @invalid_votes = Vote.count_invalid_votes_for_constituency(@constituency)
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => @constituency.name,
               :encoding => "UTF-8",
               :template => 'central/constituencies/show.pdf.erb'
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end