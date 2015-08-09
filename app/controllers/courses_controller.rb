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
    @finishedChapters = getFinishedChapter(@course)
    if !@finishedChapters.nil?
      @currentChapters = @chapters-@finishedChapters
    else
      @currentChapters=@chapters
    end
    if (current_user.active_courses.find_by(course_id: @course.id).nil?)
      @active_course = ActiveCourse.new(user_id: current_user.id, course_id: @course.id, certification_complete: false)
      @active_course.save
    end
  end

  def createTempCourse
    newCourse = Course.create(name: "Create New Course", description: "Enter Description Here", imageSource: "NewCourse.png", default: false)

    current_user.organization.courses << newCourse
    redirect_to edit_course_path newCourse.id
  end

  def index
    @available_courses =current_user.organization.courses
    @active_courses = getActiveCourses
    @finished_courses = getFinishedCourses
    @available_courses-=getActiveCourses
    @active_courses -=@finished_courses
    @temp_course = Course.find_by(name: "Create New Course")
  end

  def editMode
    @available_courses =current_user.organization.courses
    @active_courses = getActiveCourses
    @available_courses-=getActiveCourses

  end

  def save
    @oldCourse = Course.find(params[:course_id])
    i=0
    current_user.organization.courses.each do |course|
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
    @finished_courses = getFinishedCourses
    @available_courses-=getActiveCourses
    @active_courses -=@finished_courses
    @temp_course = Course.find_by(name: "Create New Course")
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

  def getFinishedCourses
    @finished_courses = Array.new
    current_user.active_courses.each do |active_course|
      if active_course.certification_complete
        @finished_courses.push Course.find(active_course.course_id)
      end
    end
    @finished_courses
  end

  def course_params
    params.require(:course).permit(:photo, :name, :description)
  end

  def getFinishedChapter course
    @finishedChapters = Array.new
    course.chapters.each do |chapter|
      if passed?(chapter)==1
        @finishedChapters.push chapter
      end
    end
    @finishedChapters
  end

  def passed? (chapter)
    if !chapter.quiz.nil? && !chapter.quiz.quiz_results.find_by(user_id: current_user.id).nil?
      if chapter.quiz.quiz_results.find_by(user_id: current_user.id, passed: false)
        return 0
      elsif chapter.quiz.quiz_results.find_by(user_id: current_user.id, passed: true)
        return 1
      end
    else
      return -1
    end
  end
end
