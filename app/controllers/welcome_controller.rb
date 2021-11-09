class WelcomeController < ApplicationController
  def index
    @projects = Project.joins(:user).left_joins(:category).order(created_at: :desc).paginate(page: params[:page], per_page: 2)
  end
end
