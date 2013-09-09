class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
   @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    # old rails 3 way: @user = User.new(params[:user])
    @user = User.new(user_params)
    if @user.save
        #can pass flash within the redirect or do this: flash.notice = "User saved"
        #as shown below in the update action. The use of flash.notice, notice is
        #lowercase and it matters!
        redirect_to @user, notice: "User saved"
    else
        render action: "new", alert: "User not saved!"
    end
  end

  def update
    if @user.update(user_params)
      #lbenote: could also: redirect_to user_url(@user)
      # (either way rails knows to go to the show template)
      flash.notice = "User updated."
      redirect_to @user
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private

  def set_user
      @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end

end
