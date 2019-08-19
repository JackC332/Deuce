class UsersController < ApplicationController
    def index 
        location = current_user.location
        @users = User.where........
    end
end
