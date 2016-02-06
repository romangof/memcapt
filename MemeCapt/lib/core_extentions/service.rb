require 'open-uri'

class Service

  def self.get_source_images_info
    JSON.parse(RestClient.get(direction(["src_images"]), content_type: :json, accept: :json))
  end

  def self.post_image(src_image_id='Eb8P9A', top_text="Top text", bottom_text='Bottom text')
    request= set_request(src_image_id, top_text, bottom_text)
    response = JSON.parse(RestClient.post(direction(['gend_images']), request.to_json, content_type: "application/json", accept: "application/json"))
    save_img(response["status_url"])
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

  def self.save_img (url)
    open(Rails.root.to_s+'/created_memes/'+Time.now.strftime('%Y-%m-%d_%H-%M-%S')+'_'+url.split('/').last+'.jpg' , 'wb') do |file|
      file << open(url).read
    end
  end

end
