class UsersController < ApplicationController

  def show
    user_id = params[:id]
    @user = User.find(user_id)
    @prototypes = @user.prototypes
end
end