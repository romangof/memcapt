class ImagesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :error_not_found
  rescue_from ActionController::ParameterMissing, with: :error_not_found

  before_action :authenticate

  def sources
    render json: Service.get_source_images_info    
  end

  def index
    render json: Image.all 
  end

  def show
    render json: Image.find( params[:id] )
  end
  
  def create
    img = Image.new(permit_params)

    if params[:user_id] != nil
      user = User.find(params[:user_id]) 
      img.user = user
    end
    if params[:category_id] != nil
      cat = Category.find(params[:category_id]) 
      img.category = cat
    end

    if img.save
      puts "service post"
      Service.post_image(permit_params[:img_id], permit_params[:top_text], permit_params[:bot_text])
      puts "posted"
      render json: {message: "TODO OK"}      
    else
      render json: img.errors.messages
    end

  end
  
  def update
    img = Image.find(params[:id])
    if img.update(permit_params)
      render json: {message: "TODO OK"}
    else
      render json: img.errors.messages
    end
  end

  def destroy
    img = Image.find(params[:id])
    if img.delete
      render json: {message: "TODO OK"}
    else
      render json: img.errors.messages
    end
  end


  private

  def permit_params
    params.require(:image).permit(
      :privacity,
      :img_id,
      :top_text,
      :bot_text,
      :category_id,
      :user_id
      )
  end

  def error_not_found(error)
    render json: {error: error.message}, status: :not_found
  end

end