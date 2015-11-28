class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_admin, only: [:edit, :update, :new, :create, :destroy]

  private
  def check_admin
    if current_user.try(:admin?) == false
      redirect_to root_path, notice: "You are not authorized to take that action"
    end
  end
end
