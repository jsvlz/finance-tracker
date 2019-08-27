class UsersController < ApplicationController

  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
  end

  def my_friends
    @friendships = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end

  def search
    #puts params[:search_param] #shows what was searched for
    if params[:search_param].blank?
      flash.now[:danger] = "Please enter a search parameter"
    else
      @users = User.search(params[:search_param]) #search method defined in user model
      @users = current_user.except_current_user(@users)
      flash.now[:danger] = "No matching users" if @users.blank?
    end
      respond_to do |format|
      format.js { render partial: 'friends/result' }
    end
  end

end
