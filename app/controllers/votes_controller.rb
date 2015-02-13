class VotesController < ApplicationController
    before_filter :authenticate_user!
    load_and_authorize_resource

    def new
      @constituency = Vote.set_constituency(current_user)
      @committee = Vote.set_committee(params)
    end

    def create
      @vote = Vote.new(vote_params)

      if @vote.save
        flash[:notice] = 'Głosy zostały dodane'
        redirect_to votes_path
      else
        render :action => 'new'
      end
    end

    def update
      if @vote.update(vote_params)
        flash[:notice] = 'Dane zostały zmienione'
        redirect_to @vote
      else
        render :action => 'edit'
      end
    end

    def index
      @current_constituency = @current_user.constituency
      @committees = Vote.get_all_committees_for_current_user(@current_user)
      @votes = Vote.get_votes_for_committees(@committees)
    end

    private
      def vote_params
        params.require(:vote).permit(
            :constituency_id,
            :committee_id,
            :number_of_votes
        )
      end

end
