require './src/command/command'
require './src/util/at_coder_problems'
require './src/util/record_util'

class CommandSubmission < Command
  def initialize(options)
    super(options, 'submission', [:userid])
  end

  def execute_all
    res = AtCoderProblems::get_submission(@options[:userid])
    return res unless @options.key?(:result)
    res.select{|c| c['result'].downcase == @options[:result]}
  end
end