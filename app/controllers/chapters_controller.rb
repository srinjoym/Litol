class ChaptersController < ApplicationController
  def new
  end
  def show
    @chapter = Chapter.find(params[:id])
  end
  def edit


    @edit_chapter = Chapter.find_by(id: params[:id])
    @course =@edit_chapter.course
    @chapters = @course.chapters
  end
  def save
    chapter = Chapter.find(params[:chapter_id])
    if params[:chapter_name]!=chapter.name
      chapter.name = params[:chapter_name]
    end
    if params[:chapter_overview]!=chapter.overview
      chapter.overview = params[:chapter_overview]
    end
    chapter.sections.each do |section|
    name = "section"+section.id.to_s+"_name"
      if section.name != params[name]
        section.name = params[name]
        section.save
      end
    end
    chapter.save
    redirect_to chapter.course
  end

end
