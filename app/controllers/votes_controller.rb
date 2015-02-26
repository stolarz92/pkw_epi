class VotesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_action  :set_constituency, only: [:new, :create, :edit, :index, :update]

  def new
    @vote = Vote.new
    @committees = Vote.get_all_committees_for_current_constituency(@current_user)
  end

  def create
    @vote = Vote.new(vote_params)
    @committees = Vote.get_all_committees_for_current_constituency(@current_user)


    if @vote.save
      flash[:notice] = 'Głosy zostały dodane'
      redirect_to votes_path
    else
      render :action => 'new'
    end
  end

  def edit
    @committee = @vote.committee.name
    @vote = set_vote(params)
  end

  def update
    if @vote.update(vote_params)
      flash[:notice] = 'Dane zostały zmienione'
      redirect_to votes_path
    else
      render :action => 'edit'
    end
  end

  def index
    @committees = Vote.get_all_committees_for_current_constituency(@current_user)
    if @constituency.present?
      @votes = Vote.get_votes(@constituency.id, @committees)
    end
  end

  private
  def vote_params
    params.require(:vote).permit(
        :constituency_id,
        :committee_id,
        :number_of_votes
    )
  end

  def set_vote(params)
    @vote = Vote.find(params[:id])
  end

  def set_committee(params)
    @committee = Committee.find(params[:id])
  end

  def set_constituency
    @constituency = @current_user.constituency
  end

end
