class PapersController < ApplicationController
  def new
    @paper = Paper.new
  end

  def create
    @paper = Paper.new(paper_params)
    if @paper.save
      redirect_to @paper
    else
      render 'new'
    end
  end

  def show
    @paper = Paper.find(params[:id])
  end

  def edit
    @paper = Paper.find(params[:id])
  end

  def index
    @papers = Paper.all
  end

  def update
    @paper = Paper.find(params[:id])

    if @paper.update(paper_params)
      redirect_to @paper
    else
      render 'edit'
    end
  end

  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    redirect_to authors_path
  end

  private
  def paper_params
    params.require(:paper).permit(:title, :venue, :year)
  end
end