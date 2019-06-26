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
      num = User.all.count
      arr =* (1..num)
      arr.delete(current_user.id)
      arr = arr.shuffle
      @suggestions = User.find(arr[0], arr[1], arr[2])
    else
      @suggestions = []
    end
  end
end
