class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  def index
    render json: Category.all
  end

  def show
    render json: Category.find( params[:id] )
  end
  
  def create
    cat = Category.new(permit_params)
    if cat.save
      render json: {message: "TODO OK"}      
    else
      render json: b.errors.message
    end

  end
  
  def update
    cat = Category.find(params[:id])
    if cat.update(permit_params)
      render json: {message: "TODO OK"}
    else
      render json: b.errors.message
    end
  end

  def destroy
    cat = Category.find(params[:id])
    if cat.delete
      render json: {message: "TODO OK"}
    else
      render json: b.errors.message
    end
  end

  private

  def permit_params
    params.require(:category).permit(:catname)
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end
  
end