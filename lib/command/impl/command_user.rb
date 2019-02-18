require 'lib/command/command'

class CommandUser < Command
  def initialize(options)
    super(options, 'user', [:userid])
  end

  def execute
    [AtCoderProblems::get_user_info(@options[:userid])]
  end
end