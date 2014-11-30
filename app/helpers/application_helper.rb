module ApplicationHelper
  def getApplicationStatus
    Rails.application.secrets.application_status
  end
end
