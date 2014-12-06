class MaintenanceController < ApplicationController
  skip_before_action :maintenance, only: [:index]
  before_action :is_online

  def index
  end

  private
  def is_online
    if Rails.application.secrets.application_status == 'online'
      redirect_to root_path
    end
  end
end
