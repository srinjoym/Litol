class CoursesController < ApplicationController
  def new
  end

  def show
    @course = Course.find(params[:id])
    @chapters = @course.chapters
    if (current_user.active_courses.find_by(course_id:@course.id).nil?)
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
    @available_courses =current_user.organization.courses
    @active_courses = getActiveCourses
    @available_courses-=getActiveCourses
    course = Course.find_by(id:params[:course_id])
    if params[:course_description]!=course.description||params[:course_name]!=course.name
      if course.default
      return
      else
        newCourse = course
      end

      # newCourse =  Course.find_by(id:params[:course_id]).dup
      # newCourse.chapters.dup
      # newCourse.chapters.sections.dup
      newCourse.name = params[:course_name]
      newCourse.description= params[:course_description]
      newCourse.save
      current_user.organization.courses.delete(course)
      current_user.organization.courses << newCourse
    end

    redirect_to courses_path
  end
def edit
  @available_courses =current_user.organization.courses
  @active_courses = getActiveCourses
  @available_courses-=getActiveCourses
  @editCourse = Course.find_by id:params[:id]
end

  private

  def cloneCourse (course)
    newCourse =  course.dup

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
      if !@available_courses.find_by(id:active_course.course_id).nil?
        @active_courses.push @available_courses.find_by(id: active_course.course_id)
      end
    end
    return @active_courses
  end



end
