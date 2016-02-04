class ImagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  def index
    render json: Image.all 
  end

  def show
    render json: Image.find( params[:id] )
  end
  
  def create
    img = Image.new(permit_params)
    if img.save
      render json: {message: "TODO OK"}      
    else
      render json: b.errors.message
    end

  end
  
  def update
    img = Image.find(params[:id])
    if img.update(permit_params)
      render json: {message: "TODO OK"}
    else
      render json: b.errors.message
    end
  end

  def destroy
    img = Image.find(params[:id])
    if img.delete
      render json: {message: "TODO OK"}
    else
      render json: b.errors.message
    end
  end


  private

  def permit_params
    params.require(:image).permit(
      :catname,
      :meme
      )
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

end