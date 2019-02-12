require './src/command/command'
require './src/util/at_coder_problems'
require './src/util/record_util'

class CommandProblem < Command
  def initialize(options)
    super(options, 'problem')
  end

  def execute_all
    res = AtCoderProblems::get_problems
    return res unless @options.key?(:problemid)
    res.select{|c| c['id'] == @options[:problemid]}
  end
end