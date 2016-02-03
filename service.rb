require "rest-client"

class Service
  
  def self.call_service(args, params='')

    response = RestClient.get( direction(args), {params:params} )
    
    if params == ''
      JSON.parse( response )
    else
      response
    end
  end

  def self.asd
    puts "asd"
    
  end

  private
  def self.direction(args)
    'http://memecaptain.com/'+args.join("/")    
  end

end
