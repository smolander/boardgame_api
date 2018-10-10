module Auth
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
    skip_before_action :verify_authenticity_token
    wrap_parameters User, include: [:email, :password, :password_confirmation]
        
    private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

      def account_update_params
      params.require(:user).permit(:email)
    end
  end
end