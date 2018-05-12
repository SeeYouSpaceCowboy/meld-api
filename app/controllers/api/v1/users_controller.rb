class Api::V1::UsersController < ApplicationController
  def login
    user = User.find_by(username: params[:user][:username])

    if user && user.authenticate(params[:user][:password])
      jwt = Auth.encrypt({ user_id: user.id })
      render json: { jwt: jwt }
    else
      render json: { error: 'Failed to Log In' }, status: 400
    end
  end

  def create
    user = User.create(strong_params)

    if user
      jwt = Auth.encrypt({ user_id: user.id })
      render json: { jwt: jwt }
    else
      render json: { error: 'Failed to Sign Up' }, status: 400
    end
  end

  def index
    users = User.all
    render json: users
  end

  def show
    render json: get_current_user
  end

  private

    def strong_params
      params.require(:user).permit(
        :username,
        :password,
        :password_confirmation,
        :first_name,
        :last_name,
        :email
      )
    end
end
