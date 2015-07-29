class CoursesController < ApplicationController
  def new
  end

  def create
    @oldCourse = Course.find_by
    @course = Course.new(course_params)

  end

  def show
    @course = Course.find(params[:id])
    @chapters = @course.chapters
    if (current_user.active_courses.find_by(course_id: @course.id).nil?)
      @active_course = ActiveCourse.new(user_id: current_user.id, course_id: @course.id, certification_complete: false)
      @active_course.save
    end
  end


  def index
    @available_courses =current_user.organization.courses
    @active_courses = getActiveCourses
    @available_courses-=getActiveCourses
  end

  def editMode
    @available_courses =current_user.organization.courses
    @active_courses = getActiveCourses
    @available_courses-=getActiveCourses

  end

  def save
    @oldCourse = Course.find(params[:course_id])
    i=0
    current_user.organization.courses.each do|course|
      if course == @oldCourse
        break
      end
      i=i+1
    end
    if !@oldCourse.default
     
      @newCourse = Course.new(course_params)
      @newCourse.id = @oldCourse.id
      @newCourse.chapters = @oldCourse.chapters
      @newCourse.chapters.each do |chapter|
        chapter.sections = @oldCourse.chapters.find_by(id: chapter.id).sections
      end
      @newCourse.default=false
      if params[:course][:photo].nil?
        if @oldCourse.photo_file_name.nil?
          @newCourse.imageSource=@oldCourse.imageSource
        else
          @newCourse.photo = @oldCourse.photo
        end

      end

      current_user.organization.courses[i] = @newCourse
      Course.delete(@oldCourse.id)
      @newCourse.save

    end

    redirect_to courses_path
  end

  def edit
    @available_courses =current_user.organization.courses
    @active_courses = getActiveCourses
    @available_courses-=getActiveCourses
    @editCourse = Course.find_by id: params[:id]
    @course= Course.new
  end

  private

  def cloneCourse (course)
    newCourse = course.dup

    course.chapters.each do |chapter|
      newChapter= chapter.dup
      newChapter.course_id =newCourse.id
      newCourse.chapters << newChapter
      chapter.sections.each do |section|
        newSection = section.dup
        newSection.chapter_id = newChapter.id
        newSection.save
        newChapter.sections << newSection
      end
    end
    newCourse.save
    newCourse
  end


  def getActiveCourses
    @available_courses =current_user.organization.courses
    @active_courses = Array.new
    current_user.active_courses.each do |active_course|
      if !@available_courses.find_by(id: active_course.course_id).nil?
        @active_courses.push @available_courses.find_by(id: active_course.course_id)
      end
    end
    return @active_courses
  end

  def course_params
    params.require(:course).permit(:photo, :name, :description)
  end


end
