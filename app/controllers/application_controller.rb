class ApplicationController < ActionController::Base

  private

  def after_sign_out_path_for(resource_or_scope)
    return new_admin_session_path if resource_or_scope == :admin
    root_path
  end

end
