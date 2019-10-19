class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
before_action :count

def count
	@angle = Post.where(choice: false)
    @daemon = Post.where(choice: true)
    a = @angle.count
    b = @daemon.count
    c = a / (a+b).to_f * 100
    d = b / (a+b).to_f * 100
    @aper = c.round
    @dper = d.round
end
    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end
end
