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

  end

  private
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
