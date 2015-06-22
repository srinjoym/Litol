class CoursesController < ApplicationController
  def new
  end
  def show
    @course = Course.find(params[:id])
    @chapters = @course.chapters
  end
  def index
    @courses = Course.all
  end
end