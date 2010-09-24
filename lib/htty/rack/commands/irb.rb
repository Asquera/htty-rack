class HTTY::CLI::Commands::Irb < HTTY::CLI::Command

  # Returns the name of a category under which help for the _irb_ command
  # should appear.
  def self.category
    'Debug'
  end

  # Returns the arguments for the command-line usage of the _irb_ command.
  def self.command_line_arguments
    ''
  end

  # Returns the help text for the _irb_ command.
  def self.help
    'Starts irb'
  end

  # Returns the extended help text for the _irb_ command.
  def self.help_extended
    'Starts irb to let you modify the environment. Use it like IRB, using' +
    '#exit brings you right back.'
  end

  # Performs the _irb_ command.
  def perform
    unless arguments.length == 0
       raise ArgumentError,
             "wrong number of arguments (#{arguments.length} for 0)"
    end
    require 'irb'
    
    IRB::start(__FILE__)
  end

end