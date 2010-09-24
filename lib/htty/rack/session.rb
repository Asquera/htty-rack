class HTTY::Rack::Session < HTTY::Session
  attr_accessor :app_file
  
  def initialize(app_file_name)
    request = HTTY::Rack::Request.new("/")
    request.app_file, request.app = HTTY::Rack.build_app(app_file_name)
    @requests = [request]
  end
  
 
end