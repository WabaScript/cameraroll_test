class UsersController < Clearance::UsersController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

    # GET /users/1
    # GET /users/1.json
  def show
    @albums = @user.albums
  end

   # GET /users/1/edit
  def edit 
    if current_user.id != @user.id 
      redirect_to current_user
    else
      render :edit
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

    private

    def user_params
      params.require(:user).permit(:email, :password, :image)
    end

    def find_user
      @user = User.find(params[:id])
    end 
end