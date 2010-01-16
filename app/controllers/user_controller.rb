class UserController < SecureController
  def index
    @user = current_user
  end
end
