class Central::CommitteesController < Central::ApplicationController

  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action :set_committee, only: [:show]

  def new
  end

  def create
  end

  def index
    @committees = Committee.all
    @votes_for_committees = Committee.count_votes_for_committees(@committees)
    @votes_for_committees_pdf = Committee.count_votes_for_committees_pdf(@committees)
    @invalid_votes = Vote.count_invalid_votes_for_country
    @attendance = Committee.count_attendance_in_country
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'Polska',
               :encoding => "UTF-8",
               :template => 'central/committees/index.pdf.erb'
      end
    end
  end

  def show
    @votes_for_committee = Committee.count_votes_for_committee(@committee)
    @all_ballots = Committee.count_all_ballots
    @result_in_percent = Committee.count_result_in_percent(@votes_for_committee, @all_ballots)
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

  def set_committee
    @committee = Committee.find(params[:id])
  end
end