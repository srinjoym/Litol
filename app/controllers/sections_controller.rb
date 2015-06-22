class SectionsController < ApplicationController
  def new
  end

  def show
    @section = Section.find(params[:id])
  end
end
