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

  def createTempChapter
    course_id = params[:course_id]
    course = Course.find(course_id)
    maxOrder=0
    course.chapters.each do |chapter|
      if chapter.order > maxOrder
        maxOrder = chapter.order
      end
    end
    newChapter = Chapter.create(name:"New Chapter",overview:"Enter Chapter Overview",course_id:course_id, order:maxOrder+1,id:Chapter.all.last.id+1)
    for i in 1..5
      newChapter.sections << Section.create(name:"Section "+i.to_s, contentType:"vid",chapter_id: newChapter.id,order:i, content:"Enter Link Here")
    end
    redirect_to edit_chapter_path newChapter.id
  end

end
