module HTTY::Rack
  class CLI < HTTY::CLI
    
    attr_accessor :config_file_name
    
    def initialize(command_line_arguments)
      app
      super
    end
    
    def app
      unless @app
        self.config_file_name, @app = HTTY::Rack::build_app
        $app = @app # ugly until fixed
      end
      @app
    end
    
    def prompt
      strong(config_file_name + ":" + 
             session.requests.last.send(:path_query_and_fragment)) +
             normal('> ')
    end
    
    def command_folders
      super + ["#{File.dirname __FILE__}/commands"]
    end    
  end
end