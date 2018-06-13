class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t("title")
      redirect_to new_user_session_path
    else
      flash[:danger] = t("danger_user")
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit :email, :name, :phone, :password,
                                   :password_confirmation
    end

end
