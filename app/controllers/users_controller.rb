class UsersController < Clearance::UsersController

    # GET /users/1
    # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

    private

    def user_params
      params.require(:user).permit(:email, :password, :image)
    end
end