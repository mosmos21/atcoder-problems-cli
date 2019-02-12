require './src/command/command'
require './src/util/at_coder_problems'
require './src/util/record_util'

class CommandUser < Command
  def initialize(options)
    super(options, 'user', [:userid])
  end

  def execute
    AtCoderProblems::get_user_info(@options[:userid])
  end
end