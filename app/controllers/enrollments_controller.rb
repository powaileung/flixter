class EnrollmentsController < ApplicationController
  # create when enrollment, user need to sign in.
  before_action :authenticate_user!
  
  # create action to create controller.
  # create action to enrollment to be stored in the database.
  # create action to redirect user to the course detail page.
  def create
    current_user.enrollments.create(course: current_course)
    redirect_to course_path(current_course)
  end

  private

  def current_course
    @current_course ||= Course.find(params[:course_id])
  end
end
