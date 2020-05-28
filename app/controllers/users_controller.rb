class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def show
        @user = current_user
        @user_records = @user.records
        @imgs = Image.all
    end
end
