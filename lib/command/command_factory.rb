require './src/command/impl/command_contest'
require './src/command/impl/command_problem'
require './src/command/impl/command_count'
require './src/command/impl/command_user'
require './src/command/impl/command_submission'

class CommandFactory
  def self.get_instance(name, options)
    cls = eval "Command#{name}"
    cls.new(options)
  end
end