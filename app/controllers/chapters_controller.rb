class ChaptersController < ApplicationController
  def new
  end
  def show
    @chapter = Chapter.find(params[:id])
  end
end
