require './src/command/impl/command_contest'

class Command

  def self.get_instance(name, options)
    cls = eval "Command#{name.capitalize}"
    cls.new(options)
  end

  def execute
    raise '[ERROR] called abstract method: execute'
  end
end