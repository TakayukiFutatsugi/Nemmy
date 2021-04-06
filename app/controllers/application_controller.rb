class ApplicationController < ActionController::Base
  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    elsif resource_class == Client
      Client::ParameterSanitizer.new(Client, :client, params)
    else  
      super # Use the default one
    end
  end
end
