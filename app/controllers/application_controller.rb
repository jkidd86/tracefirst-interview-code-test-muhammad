class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::DeleteRestrictionError, with: :delete_restricted

  def delete_restricted
    redirect_back fallback_location: url_for(controller: controller_name, action: :index),
                  notice: 'Cannot be deleted while it has associated tests.'
  end

end
