require './src/command/impl/command_contest'
require './src/command/impl/command_problem'

class CommandFactory
  def self.get_instance(name, options)
    cls = eval "Command#{name}"
    cls.new(options)
  end
end