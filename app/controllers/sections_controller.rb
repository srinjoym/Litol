class SectionsController < ApplicationController
  def new
  end

  def show
    @section = Section.find(params[:id])
    @video = youtube_embed(@section.content)
    @sections = @section.chapter.sections
    @quizzes = Quiz.all
  end

  def edit
    @section = Section.find(params[:id])
    @video = youtube_embed(@section.content)
    @sections = @section.chapter.sections
    @quizzes = Quiz.all
  end

  def saveVideo
    vidURL = params[:vidURL]
    section = Section.find(params[:section_id])
    section.content  = vidURL
    section.save
    redirect_to section
  end
  private

  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end
    "http://www.youtube.com/embed/#{ youtube_id }"
    end
end
