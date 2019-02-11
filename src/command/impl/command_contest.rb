require './src/command/command'

class CommandContest < Command

  def initialize(args)
    @args = args
  end

  def execute
    puts @args
  end
end