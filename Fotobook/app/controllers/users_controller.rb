class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :showAlbum]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end


  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end


  def new_arr(user)

    @arr = []
    @arr = @user.photos.order(:created_at).map{|x| x.link}

  end
  def arr_photos_on_album(album)
    @arr1 = []
    @arr1 = album.photos.order(:created_at).map{|x| x.link}
  end

  def new_arr1(user)
    new_arr(user)
    @album =@user.albums.includes(:photos).order(:created_at).map{|x| x.photos.map{|y| y.link}}.flatten
    # @arr += @user.albums.includes(:photos).order(:created_at).map{|x| x.photos}
    @arr +=  @album
  end

  helper_method :new_arr
  helper_method :new_arr1

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :email, :role)
    end
  end
