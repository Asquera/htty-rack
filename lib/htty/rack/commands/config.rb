class HTTY::CLI::Commands::Config < HTTY::CLI::Command

  include HTTY::CLI::CookieClearingCommand

  # Returns the name of a category under which help for the _config_ command
  # should appear.
  def self.category
    'Rack'
  end

  # Returns the arguments for the command-line usage of the _config_ command.
  def self.command_line_arguments
    'config'
  end

  # Returns the help text for the _config_ command.
  def self.help
    'Loads a new config'
  end

  # Returns the extended help text for the _config_ command.
  def self.help_extended
    'Loads a config (.ru-File) and sets the built class as the' +
    'active application. This operation clears cookies.'
  end

  # Performs the _config_ command.
  def perform
    unless arguments.length == 1
       raise ArgumentError,
             "wrong number of arguments (#{arguments.length} for 1)"
    end
    
    add_request_if_has_response do |request|
      request.app_file, request.app = HTTY::Rack::build_app arguments.first
      request
    end
  end

end