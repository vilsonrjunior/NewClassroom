class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :authenticate_teacher!
  # before_action :authenticate_student!
  # before_action :authenticate_parent!


  layout :set_layout

  # def after_sign_in_path_for(resource)
  #   current_teacher_path
  # end

  private

    def set_layout
      devise_controller? ? 'devise' : 'application'
    end

end
