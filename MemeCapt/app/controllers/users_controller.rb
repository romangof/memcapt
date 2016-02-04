class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  def index
    render json: User.all
  end

  def show
    render json: User.find( params[:id] )
  end
  
  def create
    user = User.new(permit_params)

    if user.save
      render json: {message: "TODO OK"}      
    else
      render json: b.errors.message
    end
  end
  
  def update
    user = User.find(params[:id])
    if user.update(permit_params)
      render json: {message: "TODO OK"}
    else
      render json: b.errors.message
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.delete
      render json: {message: "TODO OK"}
    else
      render json: b.errors.message
    end
  end

  private

  def permit_params
    params.require(:user).permit(
      :username,
      :password,
      :email
    )
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

end