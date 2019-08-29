class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::ImplicitRender
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  protect_from_forgery prepend: true

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end
  end


  private

    def current_user

      user_email = request.query_parameters[:user_email].presence
      user       = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, request.query_parameters[:user_token])
          user = User.find_by_email(user_email)
        return user
      else
      render :json => '{"success" : "false"}'
      end

    end
    def authenticate_user_from_token!

      user_email = params[:user_email].presence
      user       = user_email && User.find_by_email(user_email)

      # Notice how we use Devise.secure_compare to compare the token
      # in the database with the token given in the params, mitigating
      # timing attacks.
      if user && Devise.secure_compare(user.authentication_token, params[:user_token])
          user = User.find_by_email(user_email)
        return true
      else
      render :json => '{"success" : "false"}'
      end
    end
end
