require './src/command/command_contest'
require './src/command/command_problem'

class CommandFactory
  def self.get_instance(name, options)
    cls = eval "Command#{name}"
    cls.new(options)
  end
end