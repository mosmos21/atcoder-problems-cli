require 'lib/command/command'

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