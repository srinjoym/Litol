class SectionsController < ApplicationController
  def new
  end

  def show
    @section = Section.find(params[:id])
    @sections = @section.chapter.sections
  end
end
