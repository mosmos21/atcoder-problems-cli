require 'lib/command/command'

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