class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_hash, :get_suggestion

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def get_hash
    @trends = ActsAsTaggableOn::Tag.most_used(10)
  end

  def get_suggestion
    if current_user
      num = User.all.length
      arr = (1..num).to_a
      arr.delete(current_user.id)
      arr = arr.shuffle
      @suggestions = User.where(id: arr.first(3))
    else
      @suggestions = []
    end
  end
end
