class UsersController < Clearance::UsersController
    before_action :redirect_signed_in_users, only: [:create, :new]
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :require_login, only: [:show, :edit]

    # GET /users/1
    # GET /users/1.json
    def show
      @albums = @user.albums
    end

    # GET /users/new
    def new
        @user = user_from_params
        render template: "users/new"
    end
  
    # GET /users/1/edit
    def edit 
      if current_user.id != @user.id 
        redirect_to current_user
      else
        render :edit
      end
    end

    # POST /users
    # POST /users.json
    def create
        @user = user_from_params
            if @user.save
                sign_in @user
                redirect_back_or url_after_create
            else
                render template: "users/new"
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

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        @user.destroy
        respond_to do |format|
        format.html { redirect_to users_url, notice: 'user was successfully destroyed.' }
        format.json { head :no_content }
        end
    end
    
    private
    def redirect_signed_in_users
        if signed_in?
            redirect_to Clearance.configuration.redirect_url
        end
    end

    def url_after_create
        Clearance.configuration.redirect_url
    end

    def user_params
        params.require(:user).permit(:email, :password, :image, :location, :name)
    end

    def find_user
        @user = User.find(params[:id])
    end 

end