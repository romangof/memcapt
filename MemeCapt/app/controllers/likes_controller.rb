class LikesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found


  def index    
    render json: Like.all
  end

  def show    
  end
  
  def create    
  end
  
  def update    
  end

  def destroy    
  end

  private

  def permit_params    
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end
  
end