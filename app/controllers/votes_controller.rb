class VotesController < ApplicationController
    before_filter :authenticate_user!
    load_and_authorize_resource

    def new
      @vote = Vote.new
      set_committee
      set_constituency
      #@committee = Committee.find_by(params[:id])
    end

    def create
      @vote = Vote.new(vote_params)
      if @vote.save
        flash[:notice] = "Głosy zostały dodane!"
        redirect_to votes_path
      else
        render :action => 'new'
      end
    end

    def update
      if @vote.update(vote_params)
        flash[:notice] = 'Dane zostały zmienione!'
        redirect_to @vote
      else
        render :action => 'edit'
      end
    end

    def index
      set_constituency
      set_committee
    end

    private

      def vote_params
        params.require(:vote).permit(:constituency_id, :committee_id, :number_of_votes)
      end

      def set_vote
        @vote = Vote.find_by(params[:id])
      end

      def set_committee
        @committee = Committee.find_by(params[:id])
      end

      def set_constituency
        @constituency = current_user.constituency
      end

end
