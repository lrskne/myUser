class UsersController < ApplicationController
  #before_filter only:edit, update, destroy set_name
  #lbelater - why are these all called as symbols?? Question for class?
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
    # when I only had new, this automagically displays the create.html.erb
    # problem is you do not need one. The rails generate controller, put it there
    # for you
    # old way: @user = User.new(params[:user])

    @user = User.new(user_params)
    if @user.save
        flash.notice = "User saved"
        redirect_to @user
    else
        render action: "new"
    end
  end

  def update
    if @user.update(user_params)
      flash.notice = "User updated."
      #lbelater: also correct might be user_url(@user)
      # (either way rails knows to go to the show template)
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
# lbelater - here again, why symbols?, where did :user come from?
  def user_params
      params.require(:user).permit(:first_name, :last_name, :phone, :email)
  end

end
