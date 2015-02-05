class CommitteesController < ApplicationController

  before_filter :authenticate_user!

  def new

  end

  def create

  end

  def index

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
  def committee_params
    params.require(:committee).permit(:name, :logo)
  end
end
