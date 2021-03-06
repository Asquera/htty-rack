class HTTY::CLI::Commands::App < HTTY::CLI::Command

  # Returns the name of a category under which help for the _app_ command
  # should appear.
  def self.category
    'Rack'
  end

  # Returns the arguments for the command-line usage of the _app_ command.
  def self.command_line_arguments
    'constant'
  end

  # Returns the help text for the _app_ command.
  def self.help
    'Sets the active app'
  end

  # Returns the extended help text for the _app_ command.
  def self.help_extended
    'Sets the app to the constant provided. The app must be required first.' +
    'This operation does not clear cookies.'
  end

  # Performs the _app_ command.
  def perform
    unless arguments.length == 1
       raise ArgumentError,
             "wrong number of arguments (#{arguments.length} for 1)"
    end
    
    app = Module.const_get(arguments.first)
    
    add_request_if_has_response do |request|
      request.app = app
      request
    end
  end

end