class TagsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  def index
    render json: Tag.all
  end

  def show
    render json: Tag.find( params[:id] )
  end
  
  def create
    tag = Tag.new(permit_params)
    if tag.save
      render json: {message: "TODO OK"}      
    else
      render json: b.errors.message
    end

  end
  
  def update
    tag = Tag.find(params[:id])
    if tag.update(permit_params)
      render json: {message: "TODO OK"}
    else
      render json: b.errors.message
    end
  end

  def destroy
    tag = Tag.find(params[:id])
    if tag.delete
      render json: {message: "TODO OK"}
    else
      render json: b.errors.message
    end
  end

  private

  def permit_params
    params.require(:tag).permit(:tagname)
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

end