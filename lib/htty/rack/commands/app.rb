class HTTY::CLI::Commands::App < HTTY::CLI::Command

  include HTTY::CLI::CookieClearingCommand

  # Returns the name of a category under which help for the _app_ command
  # should appear.
  def self.category
    'Rack'
  end

  # Returns the arguments for the command-line usage of the _app_ command.
  def self.command_line_arguments
    'appfile'
  end

  # Returns the help text for the _app_ command.
  def self.help
    'Changes the appfile in use'
  end

  # Returns the extended help text for the _app_ command.
  def self.help_extended
    'Changes the Appfile in use'
  end

  # Performs the _app_ command.
  def perform
    unless arguments.length == 1
       raise ArgumentError,
             "wrong number of arguments (#{arguments.length} for 1)"
    end
    
    request.app = HTTY::Rack::build_app arguments.first
  end

end