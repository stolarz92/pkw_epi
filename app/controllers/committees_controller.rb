class CommitteesController < ApplicationController
  def new
    @page_title = 'Dodaj nowy komitet'
    @committee = Committee.new
  end

  def create
    @committee = Committee.new(committee_params)
    @committee.save

    redirect_to committees_path
  end

  def index
    @committees = Committee.all
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
