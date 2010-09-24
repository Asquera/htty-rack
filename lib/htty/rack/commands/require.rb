class HTTY::CLI::Commands::Require < HTTY::CLI::Command

  # Returns the name of a category under which help for the _require_ command
  # should appear.
  def self.category
    'Rack'
  end

  # Returns the arguments for the command-line usage of the _require_ command.
  def self.command_line_arguments
    'file'
  end

  # Returns the help text for the _require_ command.
  def self.help
    'requires a file'
  end

  # Returns the extended help text for the _require_ command.
  def self.help_extended
    'allows you to require a file. Works like rubys require and allows you' +
    'to load apps.'
  end

  # Performs the _require_ command.
  def perform
    unless arguments.length == 1
       raise ArgumentError,
             "wrong number of arguments (#{arguments.length} for 1)"
    end

    require arguments.first
  end

end