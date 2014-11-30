class MaintenanceController < ApplicationController
  skip_before_action :maintenance, only: [:index]

  def index
  end
end
