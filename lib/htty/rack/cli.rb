module HTTY::Rack
  class CLI < HTTY::CLI
    
    attr_accessor :config_file_name
    
    def initialize(command_line_arguments, session_class = HTTY::Rack::Session)
      super
    end

    def prompt
      last_request = session.requests.last
      if last_request.app.respond_to? :name
        display = last_request.app.name
      else
        display = last_request.app_file
      end
      
      strong(display + ":" + 
             session.requests.last.send(:path_query_and_fragment)) +
             normal('> ')
    end
    
    def command_folders
      super + ["#{File.dirname __FILE__}/commands"]
    end    
  end
end