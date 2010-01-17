class UserController < SecureController
  def index
    @user = current_user
    @user.refresh
  end
end
