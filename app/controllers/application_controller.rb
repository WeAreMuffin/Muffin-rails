class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :maintenance

  protected
  def maintenance
    if Rails.application.secrets.application_status == 'maintenance'
      redirect_to maintenance_index_path
    end
  end
end
