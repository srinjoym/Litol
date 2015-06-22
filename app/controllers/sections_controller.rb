class SectionsController < ApplicationController
  def new
  end

  def show
    @section = Section.find_by (params[:id])
  end
end
