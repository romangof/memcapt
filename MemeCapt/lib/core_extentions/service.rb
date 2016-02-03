<<<<<<< HEAD
require "rest-client"

=======
>>>>>>> e0c55dc82cc84d688ce2c46580ee39ff939deeea
class Service

  def self.get_source_images_info
    JSON.parse(RestClient.get(direction(["src_images"]), content_type: :json, accept: :json))
  end

  def self.post_image(src_image_id='Eb8P9A', top_text="Top text", bottom_text='Bottom text')
    request= set_request(src_image_id, top_text, bottom_text)
    RestClient.post(direction(['gend_images']), request.to_json, content_type: "application/json", accept: "application/json")
  end

  private

  def self.direction(args)
    'http://memecaptain.com/'+args.join("/")    
  end

  def self.set_request(src_image_id, top_text, bottom_text)
    {
      "private": false,
      "src_image_id": src_image_id,
      "captions_attributes":
      [
        {
          "text": top_text,
          "top_left_x_pct": 0.05,
          "top_left_y_pct": 0.0,
          "width_pct": 0.9,
          "height_pct": 0.25
        },
        {
          "text": bottom_text,
          "top_left_x_pct": 0.05,
          "top_left_y_pct": 0.75,
          "width_pct": 0.9,
          "height_pct": 0.25
        }
      ]
    }
  end


end


  # def self.call_service(args, params='')
  #   response = RestClient.get( direction(args), {params:params} )
    
  #   if params == ''
  #     JSON.parse( response )
  #   else
  #     response
  #   end
  # end
