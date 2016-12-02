class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def show
       @user = User.find(params[:id])
       @wikis = @user.wikis
    end

    private

    def user_params
       @user = User.new
       @user.username = params[:user][:username]
       @user.email = params[:user][:email]
       @user.password = params[:user][:password]
    end
 end
