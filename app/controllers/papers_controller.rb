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
end
