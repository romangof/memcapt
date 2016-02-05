class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  before_action :authenticate, except: [:login, :create]


  def login
    if User.find_by(username: params[:username]) != nil
      user = User.find_by(username: params[:username])
    elsif User.find_by(email: params[:email]) != nil
      user = User.find_by(email: params[:email])
    else
      render json: {message: "NOT FOUND"}
    end

    if user.password == params[:password].hash.to_s
      user.save
      render json: {message: "TODO OK, TOKEN VALID FOR AN HOUR", token: user.auth_token}
    else
      render json: {message: "NOT FOUND"}
    end
  end

  def index
    render json: User.all
  end

  def show
    render json: User.find( params[:id] )
  end
  
  def create
    user = User.new(permit_params)
    if user.save
      render json: {message: "TODO OK, TOKEN VALID FOR AN HOUR", token: user.auth_token}      
    else
      render json: user.errors.messages
    end
  end
  
  def update
    user = User.find(params[:id])
    if user.update(permit_params)
      render json: {message: "TODO OK"}
    else
      render json: user.errors.messages
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.delete
      render json: {message: "TODO OK"}
    else
      render json: user.errors.messages
    end
  end

  private

  def permit_params
    params.require(:user).permit(
      :username,
      :password,
      :auth_token,
      :email
    )
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

end