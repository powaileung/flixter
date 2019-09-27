class LessonsController < ApplicationController
  # create method when view the lesson show page, user need to sign in.
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]

  def show
  end

  private

  def require_authorized_for_current_lesson
    unless current_user.enrolled_in?(current_lesson.section.course)
        redirect_to course_path(current_lesson.section.course), alert: 'You can access to this lesson when you finish enroll in this lesson.'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end

