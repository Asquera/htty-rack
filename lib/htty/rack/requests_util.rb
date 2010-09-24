require 'rack/test'

module HTTY::Rack 
  class RequestsUtil
    class RackApp
      
      def initialize(app)
        @app = app
      end
      
      def app
        @app
      end
      
      include Rack::Test::Methods
    end
    
    class << self
      %w(get post put delete option trace).each do |v|
        define_method(v) do |request|
          request(request) do |app|
            a = RackApp.new(app)
            
            a.send(v, 
                   request.send(:path_query_and_fragment),
                   Hash[*request.headers])
          end
        end
      end
    end
    
    protected
      def self.http_response_to_status(http_response)
        [http_response.status,
         Rack::Utils::HTTP_STATUS_CODES[http_response.status]]
      end
      
    private
      def self.request(request)
        http_response = yield request.app
        headers = []
        http_response.headers.each do |*h|
          headers << h
        end
        request.send :response=,
                     HTTY::Response.new(:status  => http_response_to_status(http_response),
                                        :headers => headers,
                                        :body    => http_response.body)
        request
      end

  end
end