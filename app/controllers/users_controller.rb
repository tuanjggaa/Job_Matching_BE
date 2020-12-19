class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:edit, :destroy]

  def index
    @users = Array.new
    User.all.includes(:student, :company).each do |user|
      @users << user
    end
  end

  def new
    @user = User.all.build
  end

  def edit
  end

  def create
    @user = User.all.build(user_params)
    if user_params['account_type'] == 'student'
      @user.build_student
    elsif user_params['account_type'] == 'company'
      @user.build_company
    end

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
       redirect_to users_path
     else
       render 'edit'
     end
  end

  def destroy
    @user.destroy!    
    redirect_to users_path  
  end

  private
  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :account_type)
  end

end