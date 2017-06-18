class DashboardController < ApplicationController
  before_action :authenticate_user!

  def dashboard
  end

  def bank_statement
    @tasks = Task.where(user_id: current_user.id).order("created_at DESC")
  end

end
