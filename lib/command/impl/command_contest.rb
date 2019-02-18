require './src/command/command'
require './src/util/at_coder_problems'
require './src/util/record_util'

class CommandContest < Command
  def initialize(options)
    super(options, 'contest')
  end

  def execute_all
    res = AtCoderProblems::get_contests
    return res unless @options.key?(:contestid)
    res.select{|c| c['id'] == @options[:contestid]}
  end
end