class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(sign_up_params)

    if @user.save
      redirect_to root_path, notice: "User was successfully created."
    else
      render "devise/registrations/new", status: :unprocessable_entity
    end
  end

  private
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end